import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/models/video_banner.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/widgets/primary_button.dart';

class VideoBannerWidget extends StatelessWidget {
   const VideoBannerWidget({super.key, required this.videoBannerList});


  final   List<VideoBanner> videoBannerList;

  @override
  Widget build(BuildContext context) {
    return 

        Container(
      height: 200.h,
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.amber),
      child: CarouselSlider(
        options: CarouselOptions(autoPlay: true, viewportFraction: 1),
        items: videoBannerList.map((i) {
                    return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.videoScreener,
                      arguments: {
                        'url': i.video!,
                        'bannerId': i.sId,
                      });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(i.thumbNail!),
                            fit: BoxFit.cover)),
                    child: Stack(
                  
                      children: [
                        const Center(
                          child: Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        Positioned(
                          bottom: -1,
                          right: 0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: PrimaryButton(
                              onPressed: () {},
                              buttonText: 'Watch now',
                              height: 40.h,
                              buttonTextSize: 14.sp,
                              radius: 3,
                            ),
                          ),
                        )
                      ],
                    )),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
