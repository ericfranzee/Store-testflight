import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:photo_view/photo_view.dart';

class ReviewImages extends StatefulWidget {
  final List<Galleries> list;
  final int selectIndex;

  const ReviewImages(
      {super.key, required this.list, required this.selectIndex});

  @override
  State<ReviewImages> createState() => _ReviewImagesState();
}

class _ReviewImagesState extends State<ReviewImages> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.selectIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => Column(
        children: [
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
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: (MediaQuery.sizeOf(context).height * 2 / 3),
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return PhotoView(
                  minScale: 0.2,
                  initialScale: PhotoViewComputedScale.contained,
                  backgroundDecoration:
                      BoxDecoration(color: colors.backgroundColor),
                  imageProvider: CachedNetworkImageProvider(
                    widget.list[index].path ?? "",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
