import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/product_detail/product_detail_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/pages/product_detail_one/widgets/images_list_one.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ImageOneScreen extends StatelessWidget {
  final CustomColorSet colors;
  final ProductData? product;
  final List<Galleries>? galleries;
  final Galleries? selectImage;
  final PageController controller;

  const ImageOneScreen({
    Key? key,
    required this.colors,
    required this.galleries,
    required this.product,
    required this.selectImage,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 360.r,
          child: PageView.builder(
              itemCount: galleries?.length ?? 1,
              controller: controller,
              onPageChanged: (index) {
                context.read<ProductDetailBloc>().add(
                    ProductDetailEvent.selectImage(
                        image: galleries![index],
                        jumpTo: true,
                        nextImageTo: true));
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    AppRoute.goOnlyImagePage(
                        context: context,
                        list: galleries ?? [],
                        selectIndex:
                            galleries?.indexOf(selectImage ?? Galleries()) ??
                                0);
                  },
                  child: CustomNetworkImage(
                      url: galleries?[index].path ?? "",
                      preview: galleries?[index].preview,
                      height: 340,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      radius: 0),
                );
              }),
        ),
        8.verticalSpace,
        Align(
          alignment: Alignment.center,
          child: ImagesOneList(
            list: galleries ?? [],
            selectImageId: selectImage?.id ?? 0,
            colors: colors,
          ),
        )
      ],
    );
  }
}
