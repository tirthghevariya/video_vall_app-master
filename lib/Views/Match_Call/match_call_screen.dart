// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';
// import '../../controller/video_controller.dart';
// import '../../Resources/app_style.dart';
// import 'dart:developer';
//
// class MatchCallScreen extends StatefulWidget {
//   const MatchCallScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MatchCallScreen> createState() => _MatchCallScreenState();
// }
//
// class _MatchCallScreenState extends State<MatchCallScreen> {
//   final logger = Logger();
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Styles.primaryColor,
//         leading: BackButton(color: Styles.appBarWhite),
//         leadingWidth: 5.w,
//         title: Text(
//           "Live Video Call",
//           style: Styles.appBarStyle,
//         ),
//       ),
//       body: GetBuilder<VideoController>(
//         builder: (VideoController) {
//           final videoUrls = VideoController.videoModel?.data ?? [];
//           return VideoController.videoModel == null
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Congratulations",
//                           textAlign: TextAlign.center,
//                           style: Styles.appBarStyle.copyWith(fontSize: 22.sp),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 3.h,
//                     ),
//                     Text(
//                       'Mutual sympathy.Do not waste time\n and write to her',
//                       textAlign: TextAlign.center,
//                       style: Styles.findExactSame.copyWith(
//                           fontSize: 14.sp, fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       height: 2.h,
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Styles.primaryColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (videoUrls.isNotEmpty) {
//                           // Get a random video URL
//                           final randomUrl = getRandomVideoUrl(videoUrls);
//                           logger.i('Random video URL: $randomUrl');
//                         } else {
//                           logger.w('No video URLs available');
//                         }
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10.00),
//                         child: Text(
//                           'Match Now',
//                           style: Styles.appBarStyle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//         },
//       ),
//     );
//   }
//
//   // Function to get a random URL from a list of URLs
//   String getRandomVideoUrl(List<String> videoUrls) {
//     final random = Random();
//     final randomIndex = random.nextInt(videoUrls.length);
//     return videoUrls[randomIndex];
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:video_vall_app/Resources/Routes/routes_name.dart';
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
  // Initialize VideoController
  void initState() {
    Get.find<VideoController>().getVideoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
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
                      onPressed: () {
                        var randomUrl;
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
                  ],
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
