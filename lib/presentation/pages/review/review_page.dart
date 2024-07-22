import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/review/review_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:lottie/lottie.dart';

import 'widgets/comment_button.dart';
import 'widgets/review_info.dart';
import 'widgets/review_item.dart';
import 'widgets/review_one_item.dart';

class ReviewPage extends StatefulWidget {
  final CustomColorSet colors;
  final ScrollController controller;
  final int? shopId;
  final int? blogId;
  final int? productId;
  final int? orderId;
  final String? productUuid;

  const ReviewPage(
      {super.key,
      required this.colors,
      required this.controller,
      required this.shopId,
      required this.blogId,
      required this.productId,
      required this.productUuid,
      required this.orderId});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    controller.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      isLtr: LocalStorage.getLangLtr(),
      child: Container(
        margin: MediaQuery.viewInsetsOf(context),
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.colors.newBoxColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding:
            EdgeInsets.only(bottom: 16.r, left: 16.r, right: 16.r, top: 24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppHelper.getTrn(
                  widget.blogId == null ? TrKeys.storeReviews : TrKeys.comment),
              style: CustomStyle.interNoSemi(
                  color: widget.colors.textBlack, size: 22),
            ),
            BlocBuilder<ReviewBloc, ReviewState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 8.r, top: 24.r),
                    shrinkWrap: true,
                    controller: widget.controller,
                    children: [
                      if (state.reviewCount != null)
                        ReviewInfo(
                          colors: widget.colors,
                          reviewCount: state.reviewCount,
                        ),
                      state.isLoading
                          ? const Loading()
                          : state.list.isNotEmpty
                              ? ListView.builder(
                                  padding: EdgeInsets.only(top: 24.r),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.list.length,
                                  itemBuilder: (context, index) {
                                    return AppHelper.getType() == 0
                                        ? ReviewItem(
                                            review: state.list[index],
                                            colors: widget.colors,
                                          )
                                        : ReviewOneItem(
                                            review: state.list[index],
                                            colors: widget.colors,
                                          );
                                  })
                              : Column(
                                  children: [
                                    24.verticalSpace,
                                    Lottie.asset(
                                        "assets/lottie/empty_review.json",
                                        width: 200.r),
                                    24.verticalSpace,
                                    Text(
                                      AppHelper.getTrn(
                                          TrKeys.thereAreNoReviewsThereYet),
                                      style: CustomStyle.interNormal(
                                          color: widget.colors.textBlack),
                                    )
                                  ],
                                )
                    ],
                  ),
                );
              },
            ),
            BlocBuilder<ReviewBloc, ReviewState>(
              buildWhen: (n, p) {
                return n.isAddButton != p.isAddButton;
              },
              builder: (context, state) {
                return state.isAddButton && LocalStorage.getToken().isNotEmpty
                    ? CommentButton(
                        colors: widget.colors,
                        controller: controller,
                        shopId: widget.shopId,
                        productUuid: widget.productUuid,
                        productId: widget.productId,
                        blogId: widget.blogId,
                        orderId: widget.orderId,
                      )
                    : const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
