import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:photo_view/photo_view.dart';

class ImageChatPage extends StatelessWidget {
  final String image;

  const ImageChatPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomStyle.black,
      body: Column(
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
                      color: CustomStyle.white,
                      size: 26.r,
                    )),
                const Spacer(),
              ],
            ),
          ),
          32.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 2,
            child: PhotoView(
              imageProvider: NetworkImage(image),
            ),
          ),
        ],
      ),
    );
  }
}
