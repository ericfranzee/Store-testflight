import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/product_detail/product_detail_bloc.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/video_page.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:photo_view/photo_view.dart';

class OnlyImagePage extends StatefulWidget {
  final List<Galleries> list;
  final int selectIndex;

  const OnlyImagePage({Key? key, required this.list, required this.selectIndex})
      : super(key: key);

  @override
  State<OnlyImagePage> createState() => _OnlyImagePageState();
}

class _OnlyImagePageState extends State<OnlyImagePage> {
  late ScrollController scrollController;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.selectIndex);
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: (MediaQuery.sizeOf(context).height * 2 / 3),
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (index) {
                        context.read<ProductDetailBloc>().add(
                            ProductDetailEvent.selectImage(
                                image: widget.list[index]));
                        scrollController.animateTo(
                            MediaQuery.sizeOf(context).width * index / 3 +
                                32.r * index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      itemCount: widget.list.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            PhotoView(
                              minScale: 0.2,
                              initialScale: PhotoViewComputedScale.contained,
                              backgroundDecoration:
                                  BoxDecoration(color: colors.backgroundColor),
                              imageProvider: widget.list[index].preview == null
                                  ? CachedNetworkImageProvider(
                                      widget.list[index].path ?? "",
                                    )
                                  : CachedNetworkImageProvider(
                                      widget.list[index].preview ?? "",
                                    ),
                            ),
                            if (widget.list[index].preview != null)
                              Positioned.fill(
                                child: Center(
                                  child: ButtonEffectAnimation(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => VideoPage(
                                                  url: widget
                                                      .list[index].path)));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8.r),
                                      decoration: BoxDecoration(
                                          color: CustomStyle.white
                                              .withOpacity(0.8),
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        FlutterRemix.play_fill,
                                        color: CustomStyle.black,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 3,
                    child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                      buildWhen: (p, n) {
                        return p.selectImage?.id != n.selectImage?.id;
                      },
                      builder: (context, state) {
                        return ListView.builder(
                            controller: scrollController,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.list.length,
                            itemBuilder: (context, i) {
                              return Container(
                                margin: EdgeInsets.all(6.r),
                                padding: EdgeInsets.all(2.r),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: state.selectImage?.id ==
                                                widget.list[i].id
                                            ? colors.primary
                                            : colors.icon)),
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<ProductDetailBloc>().add(
                                        ProductDetailEvent.selectImage(
                                            image: widget.list[i]));
                                    pageController.animateToPage(i,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  },
                                  child: CustomNetworkImage(
                                    width: MediaQuery.sizeOf(context).width / 3,
                                    height:
                                        MediaQuery.sizeOf(context).height / 3,
                                    url: widget.list[i].path ?? "",
                                    preview: widget.list[i].preview,
                                    radius: 0,
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
              SafeArea(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          FlutterRemix.close_circle_fill,
                          color: CustomStyle.primary,
                          size: 26.r,
                        )),
                    const Spacer(),
                    BlocBuilder<ProductDetailBloc, ProductDetailState>(
                      builder: (context, state) {
                        return Text(
                          "${(widget.list.indexOf(state.selectImage ?? Galleries()) + 1)}/${state.galleries.length}",
                          style:
                              CustomStyle.interRegular(color: colors.primary),
                        );
                      },
                    ),
                    16.horizontalSpace,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
