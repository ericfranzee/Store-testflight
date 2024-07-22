import 'package:flutter/material.dart';
import 'package:ibeauty/domain/model/model/stepper_steps.dart';

class CasaVerticalStepperView extends StatefulWidget {
  final List<StepperStep> steps;

  final Color? backgroundColor;

  /// this color will apply single color to all seperator line
  /// if this value is null then apply color according to [completeColor], [inProgressColor], [upComingColor]
  final Color? seperatorColor;
  final Color? completeColor;
  final Color? inProgressColor;
  final Color? upComingColor;
  final bool isExpandable;
  final bool showStepStatusWidget;
  final ScrollPhysics? physics;

  const CasaVerticalStepperView({
    required this.steps,
    this.seperatorColor,
    this.completeColor,
    this.inProgressColor,
    this.upComingColor,
    this.backgroundColor,
    this.isExpandable = false,
    this.showStepStatusWidget = true,
    this.physics,
    Key? key,
  }) : super(key: key);

  @override
  State<CasaVerticalStepperView> createState() =>
      _CasaVerticalStepperViewState();
}

class _CasaVerticalStepperViewState extends State<CasaVerticalStepperView> {
  Color defaultPrimaryColor = const Color(0xff14A800);
  Color defaultInProgressColor = const Color(0xffFFBE18);
  Color defaultUpComingViewColor = const Color(0xffD2D5DF);
  Color defaultFailColor = const Color(0xffD33D3D);

// contant values
  double kLineWidth = 1.0;
  double kStepSize = 28.0;
  double kStepMargin = 24.0;
  double kStepPadding = 8.0;
  double kStepSpacing = 12.0;
  double kStepFontSize = 20.0;
  double kTriangleHeight = 28.0 * 0.866025;
  Duration kThemeAnimationDuration = const Duration(milliseconds: 200);

  late Color completeColor = widget.completeColor ?? defaultPrimaryColor;
  late Color inProgressColor = widget.inProgressColor ?? defaultInProgressColor;
  late Color upComingColor = widget.upComingColor ?? defaultUpComingViewColor;
  List<StepperStep> steps = [];

  late List<GlobalKey> _keys;

  @override
  Widget build(BuildContext context) {
    steps.clear();
    for (var step in widget.steps) {
      if (step.visible) steps.add(step);
    }
    _keys =
    List<GlobalKey>.generate(widget.steps.length, (int i) => GlobalKey());
    return _buildVertical();
  }

  Widget _buildVertical() {
    return widget.isExpandable
        ? _buildPanel()
        : ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: widget.physics ?? const NeverScrollableScrollPhysics(),
      children: steps
          .map((step) => Visibility(
        visible: step.visible,
        child: Column(
          key: _keys[steps.indexOf(step)],
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildVerticalHeader(step),
            _buildVerticalBody(step),
          ],
        ),
      ))
          .toList(),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 0.0,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (int index, bool isExpanded) {
        widget.steps[index].isExpanded = isExpanded;
        setState(() {});
      },
      children: steps.map<ExpansionPanel>((StepperStep step) {
        return ExpansionPanel(
          backgroundColor: widget.backgroundColor ??
              Theme.of(context).scaffoldBackgroundColor,
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _buildVerticalHeader(step);
          },
          body: _buildVerticalBody(step),
          isExpanded:
          !step.isExpandedShow ? step.isExpandedShow : step.isExpanded,
        );
      }).toList(),
    );
  }

  Color _stepColor(StepStatus status) {
    if (status == StepStatus.complete) {
      return completeColor;
    } else if (status == StepStatus.inprogress) {
      return inProgressColor;
    } else if (status == StepStatus.upcoming) {
      return upComingColor;
    } else {
      return defaultFailColor;
    }
  }

  Widget _buildVerticalHeader(StepperStep step) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kStepMargin),
      child: Row(
        children: <Widget>[
          _buildIcon(step),
          Container(
            margin: EdgeInsetsDirectional.only(start: kStepSpacing),
            child: step.title,
          ),
          const Spacer(),
          step.trailing ?? const SizedBox(height: 0, width: 0)
        ],
      ),
    );
  }

  Widget _buildVerticalBody(StepperStep step) {
    const kTopMargin = 10.0;
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: kStepMargin,
          // top: kTopMargin,
          // bottom: _kStepMargin,
          top: 8,
          bottom: 8,
          child: SizedBox(
            width: kStepSize,
            child: Center(
              child: SizedBox(
                width: kLineWidth,
                child: Container(
                  color: widget.seperatorColor ?? _stepColor(step.status),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 1.5 * kStepMargin + kStepSize,
            end: kStepMargin,
            bottom: kStepMargin,
            top: kTopMargin,
          ),
          child: step.status == StepStatus.fail ? step.failedView : step.view,
        ),
      ],
    );
  }

  Widget _buildIcon(StepperStep step) {
    const double iconSize = 34.0;
    final status = step.status;
    if (step.leading != null) {
      return step.leading!;
    } else {
      switch (status) {
        case StepStatus.complete:
          return Icon(Icons.check_box, color: completeColor, size: iconSize);

        case StepStatus.inprogress:
          return Icon(Icons.check_box_outlined,
              color: inProgressColor, size: iconSize);

        case StepStatus.upcoming:
          return Icon(Icons.check_box_outlined,
              color: upComingColor, size: iconSize);

        case StepStatus.fail:
          return Icon(Icons.warning, color: defaultFailColor, size: iconSize);
        case StepStatus.none:
          return Icon(Icons.check_box_outlined,
              color: inProgressColor, size: iconSize);
      }
    }
  }
}