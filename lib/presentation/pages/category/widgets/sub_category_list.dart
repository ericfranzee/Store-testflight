import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/presentation/components/sub_category_item.dart';

class SubCategoryList extends StatelessWidget {
  const SubCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return (state.selectCategoryTwo?.children?.isNotEmpty ?? false)
            ? GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.r),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 116.r,
            ),
            itemCount:
            state.selectCategoryTwo?.children?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(4.r),
                child: SubCategoryItem(
                    categoryData:
                    state.selectCategoryTwo?.children?[index]),
              );
            })
            : GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.r),
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 116.r,
            ),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(4.r),
                child: SubCategoryItem(
                    categoryData: state.selectCategoryTwo),
              );
            });
      },
    );
  }
}
