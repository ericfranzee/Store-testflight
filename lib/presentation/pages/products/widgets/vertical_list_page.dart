import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/presentation/components/product_items/vertical_product_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class VerticalListPage extends StatelessWidget {
  final List<ProductData> list;
  final RefreshController refreshController;
  final VoidCallback onLoading;
  final VoidCallback onRefresh;

  const VerticalListPage(
      {Key? key,
      required this.list,
      required this.refreshController,
      required this.onLoading,
      required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      onLoading: onLoading,
      onRefresh: onRefresh,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(right: 16.r,left: 16.r,top: 16.r),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return VerticalProductItem(
              product: list[index],
            );
          }),
    );
  }
}
