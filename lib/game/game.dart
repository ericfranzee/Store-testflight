import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:ibeauty/application/game/game_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';

import 'components/button.dart';
import 'components/empy_board.dart';
import 'components/score_board.dart';
import 'components/tile_board.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<StatefulWidget> createState() => _GameState();
}

class _GameState extends State<Game>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late final AnimationController _moveController = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: this,
  )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.read<GameBloc>().add(const GameEvent.merge());
        _scaleController.forward(from: 0.0);
      }
    });

  late final CurvedAnimation _moveAnimation = CurvedAnimation(
    parent: _moveController,
    curve: Curves.easeInOut,
  );

  late final AnimationController _scaleController = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.read<GameBloc>().add(GameEvent.endRound(
            onSuccess: () {
              _moveController.forward(from: 0.0);
            },
            onFail: () {}));
      }
    });

  late final CurvedAnimation _scaleAnimation = CurvedAnimation(
    parent: _scaleController,
    curve: Curves.easeInOut,
  );

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, controller) {
      return Scaffold(
        backgroundColor: colors.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      AppHelper.getTrn(TrKeys.game),
                      style: CustomStyle.interNoSemi(
                          color: colors.textBlack, size: 18),
                    ),
                    32.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                ScoreBoard(
                                  colors: colors,
                                ),
                                32.horizontalSpace,
                                ButtonWidget(
                                  icon: Icons.undo,
                                  onPressed: () {
                                    context
                                        .read<GameBloc>()
                                        .add(const GameEvent.undo());
                                  },
                                  colors: colors,
                                ),
                                16.horizontalSpace,
                                ButtonWidget(
                                  colors: colors,
                                  icon: Icons.refresh,
                                  onPressed: () {
                                    //Restart the game
                                    context
                                        .read<GameBloc>()
                                        .add(const GameEvent.newGame());
                                  },
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              32.verticalSpace,
              SwipeDetector(
                onSwipe: (direction, offset) {
                  context.read<GameBloc>().add(GameEvent.move(
                      onSuccess: () {
                        _moveController.forward(from: 0.0);
                      },
                      onFail: () {},
                      direction: direction));
                },
                child: Stack(
                  children: [
                    const EmptyBoardWidget(),
                    TileBoardWidget(
                        colors: colors,
                        moveAnimation: _moveAnimation,
                        scaleAnimation: _scaleAnimation)
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: PopButton(colors: colors),
      );
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      context.read<GameBloc>().add(const GameEvent.save());
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _moveAnimation.dispose();
    _scaleAnimation.dispose();
    _moveController.dispose();
    _scaleController.dispose();
    super.dispose();
  }
}
