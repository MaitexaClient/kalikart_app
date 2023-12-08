import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({
    super.key,
    required this.url
    });

  final String url;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  FlickManager ? flickManager;


   @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.networkUrl(Uri.parse(widget.url)),
    );
  }

  @override
  void dispose() {
    flickManager?.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.kblack,
      body: FlickVideoPlayer(flickManager: flickManager!),
    );
  }
}