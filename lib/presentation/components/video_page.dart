import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String? url;

  const VideoPage({super.key, required this.url});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url ?? ""))
          ..initialize().then((_) {
            _chewieController = ChewieController(
              videoPlayerController: videoPlayerController,
              autoPlay: true,
              looping: true,
              hideControlsTimer: const Duration(seconds: 1),
              materialProgressColors: ChewieProgressColors(
                playedColor: CustomStyle.black,
                handleColor: CustomStyle.primary,
                backgroundColor: CustomStyle.bgDark,
                bufferedColor: CustomStyle.textHint,
              ),
              autoInitialize: true,
            );
            setState(() {});
          });
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
    );
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomStyle.bgDark,
      appBar: AppBar(
        backgroundColor: CustomStyle.bgDark,
      ),
      body: SafeArea(
        top: false,
        child: _chewieController.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController,
              )
            : const Loading(
                changeColor: true,
              ),
      ),
    );
  }
}
