import 'dart:math';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:video_vall_app/helper/facebook_admanager.dart';
import '../../Resources/Routes/routes_name.dart';
import '../../controller/video_controller.dart';
import '../../Resources/app_style.dart';

class MatchCallScreen extends StatefulWidget {
  const MatchCallScreen({Key? key}) : super(key: key);

  @override
  State<MatchCallScreen> createState() => _MatchCallScreenState();
}

class _MatchCallScreenState extends State<MatchCallScreen> {
  final logger = Logger();
  final VideoController videoController = Get.put(VideoController());
  final FacebookAdController facebookAdController = Get.put(FacebookAdController());

  @override
  void initState() {
    Get.find<VideoController>().getVideoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Styles.primaryColor,
        leading: BackButton(color: Styles.appBarWhite),
        leadingWidth: 5.w,
        title: Text(
          "Live Video Call",
          style: Styles.appBarStyle,
        ),
      ),
      body: GetBuilder<VideoController>(
        builder: (videoController) {
          final videoUrls = videoController.videoModel?.data ?? [];
          return videoController.videoModel == null
              ? Center(child: SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.white : Colors.grey,
                      ),
                    );
                  },
                ))
              : Container(
                  color: Color(0xff161922),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Congratulations",
                              textAlign: TextAlign.center,
                              style: Styles.appBarStyle.copyWith(fontSize: 22.sp),
                            ),
                          ],
                        ),
                        const Image(
                            image: AssetImage('assets/images/best_matches.jpg')),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Mutual sympathy. Do not waste time\n and write to her',
                          textAlign: TextAlign.center,
                          style: Styles.findExactSame.copyWith(
                              fontSize: 14.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          onPressed: () async {
                            String? randomUrl;
                            if (videoUrls.isNotEmpty) {
                              randomUrl = getRandomVideoUrl(videoUrls);
                              logger.i('Random video URL: $randomUrl');
                            } else {
                              logger.w('No video URLs available');
                            }
                            Get.toNamed(
                              RoutesName.videoCallScreen,
                              arguments: {'url': randomUrl},
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.00),
                            child: Text(
                              'Match Now',
                              style: Styles.appBarStyle,
                            ),
                          ),
                        ),
                        FacebookNativeAd(
                          adType: NativeAdType.NATIVE_AD_HORIZONTAL,
                          keepAlive: true,
                          placementId: facebookAdController.faceBookNativeAdPlacementID.value,
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  String getRandomVideoUrl(List<String> videoUrls) {
    final random = Random();
    final randomIndex = random.nextInt(videoUrls.length);
    return videoUrls[randomIndex];
  }
}
