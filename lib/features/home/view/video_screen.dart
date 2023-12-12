import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/home/controller/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({
    super.key,
    required this.url,
    required this.bannerId,
  });

  final String url;
  final String bannerId;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  FlickManager? flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.networkUrl(Uri.parse(widget.url)),
        onVideoEnd: () {
          context
              .read<HomeController>()
              .addCreditPoint(bannerId: widget.bannerId, context: context);

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content:
                    Consumer<HomeController>(builder: (context, value, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BoldTextStyle(size: 20, text: 'You are earned'),
                      SizedBox(
                        height: 20,
                      ),
                      value.loading
                          ? CircularProgressIndicator(
                              color: AppColor.kGreenColor,
                            )
                          : BoldTextStyle(
                              size: 20, text: '₹${value.creditPoint ?? '0'}'),
                    ],
                  );
                }),
                actions: [PrimaryButton(onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, RouteName.rootScreen , (route) => false);
                }, buttonText: 'ok')],
              );
            },
          );
        });
  }

  @override
  void dispose() {
    flickManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kblack,
      body: FlickVideoPlayer(
        flickManager: flickManager!,
        flickVideoWithControls: const FlickVideoWithControls(
          controls: null,
        ),
      ),
    );
  }
}
