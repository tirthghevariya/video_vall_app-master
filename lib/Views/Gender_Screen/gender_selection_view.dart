// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_vall_app/Resources/app_style.dart';
import 'package:video_vall_app/helper/facebook_admanager.dart';

import '../../Resources/Routes/routes_name.dart';
import '../policywebview.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  bool isMaleSelected = true; // Initialize to male
  void _toggleGender() {
    setState(() {
      isMaleSelected = !isMaleSelected;
    });
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
        leading: BackButton(
          color: Styles.appBarWhite,
          onPressed: () {
            Get.back();
          },
        ),
        leadingWidth: 5.w,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PolicyWebViewPage(
                  url:
                      "https://gydfgykhbgg.blogspot.com/2023/07/privacy-policy-we-have-built-app-as.html",
                ),
              ));
            },
            child: Text('Policy',
                style: Styles.commonButtonTheme.copyWith(fontSize: 14.sp)),
          ),
          const SizedBox(width: 10)
        ],
        title: Text(
          "Live Video Call",
          style: Styles.commonButtonTheme.copyWith(fontSize: 14.sp),
        ),
      ),
      body: SizedBox(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.h,
                  child: Image.asset(
                    'assets/images/gender_shadow.png',
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  top: 20.h,
                  left: 10.w,
                  child: Text(
                    "Find exactly the",
                    textAlign: TextAlign.center,
                    style: Styles.commonButtonTheme.copyWith(
                        fontSize: 15.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  top: 25.h,
                  left: 10.w,
                  child: Text(
                    "Right Partner \nfor you",
                    textAlign: TextAlign.start,
                    style: Styles.appBarStyle.copyWith(fontSize: 20.sp),
                  ),
                ),
                // FacebookBannerAd(
                //   bannerSize: BannerSize.STANDARD,
                //   keepAlive: true,
                //   placementId: bannerPlacementId,
                // ),

                Positioned(
                  top: 50.h,
                  left: 10.w,
                  right: 10.w,
                  child: Text(
                    "i am interested in".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Styles.appBarStyle.copyWith(fontSize: 16.sp),
                  ),
                ),
                Positioned(
                  top: 58.h,
                  left: 5.w,
                  right: 5.w,
                  child: GestureDetector(
                    onTap: _toggleGender,
                    child: Container(
                      height: 6.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Styles.switchColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 6.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: isMaleSelected
                                  ? Styles.primaryColor
                                  : Styles.switchColor,
                            ),
                            child: Center(
                              child: Text(
                                "MAN",
                                style: Styles.appBarStyle
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ),
                          ),
                          Container(
                            height: 7.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                color: isMaleSelected
                                    ? Styles.switchColor
                                    : Styles.primaryColor),
                            child: Center(
                              child: Text(
                                "WOMAN",
                                style: Styles.appBarStyle
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //FacebookBannerAd(
                //   bannerSize: BannerSize.STANDARD,
                //   keepAlive: true,
                //   placementId: Get.find<FacebookAdController>().faceBookBannerAdPlacementID.value,
                // ),

                Positioned(
                  top: 75.h,
                  left: 5.w,
                  right: 5.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Styles.primaryColor,
                      fixedSize: Size(double.infinity, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: () {
                      Get.find<FacebookAdController>()
                          .showFacebookInterstitialAd();
                      Get.toNamed(RoutesName.catGallery);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Continue", style: Styles.commonButtonTheme),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
