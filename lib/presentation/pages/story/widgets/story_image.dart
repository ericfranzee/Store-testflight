import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';
import 'package:ibeauty/domain/model/model/story_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:jiffy/jiffy.dart';

class StoryImage extends StatefulWidget {
  final List<StoryModel?>? story;
  final VoidCallback nextPage;
  final VoidCallback prevPage;

  const StoryImage(
      {Key? key,
      required this.story,
      required this.nextPage,
      required this.prevPage})
      : super(key: key);

  @override
  State<StoryImage> createState() => _StoryImageState();
}

class _StoryImageState extends State<StoryImage> with TickerProviderStateMixin {
  late AnimationController controller;
  final pageController = PageController(initialPage: 0);
  GlobalKey imageKey = GlobalKey();
  int currentIndex = 0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    )..addListener(() {
        if (controller.status == AnimationStatus.completed) {
          if (currentIndex == widget.story!.length - 1) {
            widget.nextPage();
          } else {
            currentIndex++;
            controller.reset();
            controller.forward();
          }
        }
        setState(() {});
      });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: widget.story?[currentIndex]?.url ?? "",
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          fit: BoxFit.cover,
          imageBuilder: (context, image) {
            return _imageWidget(image, context);
          },
          progressIndicatorBuilder: (context, url, progress) {
            return const Loading();
          },
          errorWidget: (context, url, error) {
            return _errorWidget(context);
          },
        ),
        _leftAndRight(context),
        _shopInfo(context),
        _bottom(),
      ],
    );
  }

  Align _shopInfo(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  AppRouteShop.goShopPage(
                      context: context,
                      shop: ShopData(
                        id: widget.story?.first?.shopId,
                        uuid: widget.story?.first?.shopUuid,
                      ));
                },
                child: Row(
                  children: [
                    6.horizontalSpace,
                    CustomNetworkImage(
                        url: widget.story?.first?.logoImg ?? "",
                        height: 46,
                        width: 46,
                        radius: 4),
                    6.horizontalSpace,
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 200.r,
                      child: Text(
                        widget.story?.first?.title ?? "",
                        style: CustomStyle.interNormal(
                            size: 14.sp, color: CustomStyle.white),
                      ),
                    ),
                    6.horizontalSpace,
                    Text(
                      Jiffy.parseFromDateTime(
                              widget.story?[currentIndex]?.createdAt ??
                                  DateTime.now())
                          .fromNow(),
                      style: CustomStyle.interNormal(
                          size: 10.sp, color: CustomStyle.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: CustomStyle.transparent,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 8.r, bottom: 8.r, left: 8.r, right: 4.r),
                    child: const Icon(
                      Icons.close,
                      color: CustomStyle.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _bottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 32.h),
          child: SizedBox(
            height: 64.r,
            child: CustomButton(
              title: AppHelper.getTrn(TrKeys.viewShop),
              onTap: () {
                AppRouteShop.goShopPage(
                    context: context,
                    shop: ShopData(
                        id: widget.story?.first?.shopId,
                        uuid: widget.story?.first?.shopUuid));
              },
              bgColor: CustomStyle.primary,
              titleColor: CustomStyle.white,
            ),
          ),
        ),
      ),
    );
  }

  Row _leftAndRight(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onLongPressStart: (s) {
            controller.stop();
          },
          onLongPressEnd: (s) {
            controller.forward();
          },
          onTap: () {
            if (currentIndex != 0) {
              currentIndex--;
              controller.reset();
              controller.forward();
              setState(() {});
            } else {
              widget.prevPage();
            }
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width / 2,
            height: MediaQuery.sizeOf(context).height,
            color: CustomStyle.transparent,
          ),
        ),
        GestureDetector(
          onLongPressStart: (s) {
            controller.stop();
          },
          onLongPressEnd: (s) {
            controller.forward();
          },
          onTap: () {
            if (currentIndex != widget.story!.length - 1) {
              currentIndex++;
              controller.reset();
              controller.forward();
              setState(() {});
            } else {
              widget.nextPage();
            }
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width / 2,
            height: MediaQuery.sizeOf(context).height,
            color: CustomStyle.transparent,
          ),
        ),
      ],
    );
  }

  Stack _imageWidget(ImageProvider<Object> image, BuildContext context) {
    return Stack(
      key: imageKey,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.fitWidth),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Container(
              height: 4.h,
              color: CustomStyle.transparent,
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.only(left: 20.w, top: 10.h),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.story?.length ?? 0,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      margin: EdgeInsets.only(right: 8.w),
                      height: 4.h,
                      width: (MediaQuery.sizeOf(context).width -
                              (36.w +
                                  ((widget.story!.length == 1
                                          ? widget.story!.length
                                          : (widget.story!.length - 1)) *
                                      8.w))) /
                          widget.story!.length,
                      decoration: BoxDecoration(
                        color: currentIndex >= index
                            ? CustomStyle.primary
                            : CustomStyle.white,
                        borderRadius: BorderRadius.all(Radius.circular(122.r)),
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: currentIndex == index
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(122.r)),
                              child: LinearProgressIndicator(
                                value: controller.value,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    CustomStyle.primary),
                                backgroundColor: CustomStyle.white,
                              ),
                            )
                          : currentIndex > index
                              ? ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(122.r)),
                                  child: const LinearProgressIndicator(
                                    value: 1,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        CustomStyle.primary),
                                    backgroundColor: CustomStyle.white,
                                  ),
                                )
                              : const SizedBox.shrink(),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }

  Stack _errorWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: CustomStyle.textHint,
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FlutterRemix.image_line,
                color: CustomStyle.white,
                size: 32.r,
              ),
              8.verticalSpace,
              Text(
                AppHelper.getTrn(TrKeys.notFound),
                style: CustomStyle.interNormal(color: CustomStyle.white),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Container(
              height: 4.h,
              color: CustomStyle.transparent,
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.only(left: 20.w, top: 10.h),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.story?.length ?? 0,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      margin: EdgeInsets.only(right: 8.w),
                      height: 4.h,
                      width: (MediaQuery.sizeOf(context).width -
                              (36.w +
                                  ((widget.story!.length == 1
                                          ? widget.story!.length
                                          : (widget.story!.length - 1)) *
                                      8.w))) /
                          widget.story!.length,
                      decoration: BoxDecoration(
                        color: currentIndex >= index
                            ? CustomStyle.primary
                            : CustomStyle.white,
                        borderRadius: BorderRadius.all(Radius.circular(122.r)),
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: currentIndex == index
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(122.r)),
                              child: LinearProgressIndicator(
                                value: controller.value,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    CustomStyle.primary),
                                backgroundColor: CustomStyle.white,
                              ),
                            )
                          : currentIndex > index
                              ? ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(122.r)),
                                  child: const LinearProgressIndicator(
                                    value: 1,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        CustomStyle.primary),
                                    backgroundColor: CustomStyle.white,
                                  ),
                                )
                              : const SizedBox.shrink(),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
