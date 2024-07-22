import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/map/map_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tpying_delay.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/pages/map/widgets/main_list_shimmer.dart';
import 'package:ibeauty/presentation/pages/map/widgets/searched_location_item.dart';
import 'package:ibeauty/presentation/style/style.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  late TextEditingController searchController;
  final _delayed = Delayed(milliseconds: 700);

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              return Column(
                children: [
                  Text(
                    AppHelper.getTrn(TrKeys.location),
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 22),
                  ),
                  24.verticalSpace,
                  CustomTextFormField(
                    controller: searchController,
                    autoFocus: true,
                    radius: 10,
                    prefixIcon: const Icon(
                      FlutterRemix.search_2_line,
                      color: CustomStyle.textHint,
                    ),
                    hint: AppHelper.getTrn(TrKeys.searchLocation),
                    onChanged: (s) {
                      _delayed.run(() {
                        context
                            .read<MapBloc>()
                            .add(MapEvent.searchLocations(search: s));
                      });
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: colors.backgroundColor,
                    ),
                    padding: REdgeInsets.symmetric(vertical: 16),
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
                                isLast:
                                    state.searchedPlaces.length - 1 == index,
                                onTap: () {
                                  Navigator.pop(context,
                                      state.searchedPlaces[index]);
                                },
                                colors: colors,
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }
}
