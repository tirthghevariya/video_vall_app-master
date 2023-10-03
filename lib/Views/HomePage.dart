// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:video_vall_app/Resources/app_style.dart';
import 'package:video_vall_app/helper/facebook_admanager.dart';

import '../Resources/Routes/routes_name.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  FacebookAdController facebookAdController = Get.put(FacebookAdController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        leading: Container(),
        leadingWidth: 0,
        actions: [
          Text("Policy", style: Styles.appBarStyle),
          SizedBox(width: 10)
        ],
        title: Text("Live Video Call", style: Styles.appBarStyle),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              "assets/images/person1.png",
              // scale: 5,
            ),
            Text(
              "It's Match",
              style: GoogleFonts.montserrat(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              textAlign: TextAlign.center,
              "Chat get to know each other and first face-to-face.Enjoy safe discrete Video Calling....",
              style: GoogleFonts.montserrat(
                  // fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            FacebookBannerAd(
              bannerSize: BannerSize.STANDARD,
              keepAlive: true,
              placementId: bannerPlacementId,
            ),
            SizedBox(height: 10.h,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Styles.primaryColor,
                fixedSize: Size(double.infinity, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                facebookAdController.showFacebookInterstitialAd();
                Get.toNamed(RoutesName.genderSelection);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's Start",
                    style: Styles.commonButtonTheme,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
