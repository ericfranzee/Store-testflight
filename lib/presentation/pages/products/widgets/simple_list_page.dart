import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/components/product_items/product_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SimpleListPage extends StatelessWidget {
  final List<ProductData> list;
  final RefreshController refreshController;
  final VoidCallback? onLoading;
  final VoidCallback? onRefresh;

  const SimpleListPage({
    Key? key,
    required this.list,
    required this.refreshController,
     this.onLoading,
     this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
            controller: refreshController,
            enablePullUp: onLoading != null,
            onLoading: onLoading,
            onRefresh: onRefresh,
            child: GridView.builder(
                padding: EdgeInsets.only(right: 16.r,left: 16.r,top: 16.r,bottom: 100.r),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8.r,
                    crossAxisCount: 2,
                    mainAxisExtent: AppHelper.getType() == 0 ? 336.r : 356.r),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.r),
                    child: ProductItem(product: list[index]),
                  );
                }),
          );
  }
}
