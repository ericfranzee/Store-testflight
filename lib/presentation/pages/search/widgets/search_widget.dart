import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/map/map_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tpying_delay.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/pages/map/widgets/main_list_shimmer.dart';
import 'package:ibeauty/presentation/pages/map/widgets/searched_location_item.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class SearchWidget extends StatefulWidget {
  final CustomColorSet colors;

  const SearchWidget({super.key, required this.colors});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _delayed = Delayed(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            64.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50.r,
                    margin: EdgeInsets.symmetric(horizontal: 16.r),
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: widget.colors.icon,
                          offset: const Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ],
                      color: widget.colors.backgroundColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          FlutterRemix.search_line,
                          size: 20.r,
                          color: widget.colors.textBlack,
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: TextFormField(
                            controller: state.textController,
                            style: CustomStyle.interNormal(
                                color: widget.colors.textBlack, size: 16),
                            onChanged: (s) {
                              _delayed.run(() {
                                context
                                    .read<MapBloc>()
                                    .add(MapEvent.searchLocations(search: s));
                              });
                            },
                            cursorWidth: 1.r,
                            cursorColor: widget.colors.textBlack,
                            decoration: InputDecoration.collapsed(
                              hintText: AppHelper.getTrn(TrKeys.searchLocation),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              context
                                  .read<MapBloc>()
                                  .add(const MapEvent.clearSearchField()),
                          splashRadius: 20.r,
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            FlutterRemix.close_line,
                            size: 20.r,
                            color: widget.colors.textBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (state.isSearching)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: widget.colors.backgroundColor,
                ),
                margin: REdgeInsets.symmetric(horizontal: 16, vertical: 6),
                padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: state.isSearchLoading
                    ? const MainListShimmer()
                    : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.searchedPlaces.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return SearchedLocationItem(
                      place: state.searchedPlaces[index],
                      isLast: state.searchedPlaces.length - 1 == index,
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<MapBloc>().add(MapEvent.goToLocation(
                            place: state.searchedPlaces[index]));
                      },
                      colors: widget.colors,
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
