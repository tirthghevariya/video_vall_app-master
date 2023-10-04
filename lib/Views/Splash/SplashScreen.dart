// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:video_vall_app/Resources/Routes/routes_name.dart';
import 'package:video_vall_app/Resources/app_style.dart';
import 'package:video_vall_app/helper/facebook_admanager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  FacebookAdController facebookAdController = Get.put(FacebookAdController());
  navigate() {
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(RoutesName.splashScreen2);
    });
  }

  StreamSubscription? internetConnection;
  bool isOffLine = false;

  @override
  void initState() {
    log("isOffline $isOffLine");
    log("AFAF $internetConnection");
    internetConnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenVery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          isOffLine = true;
        });
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        setState(() {
          isOffLine = false;
        });
        navigate();
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        setState(() {
          isOffLine = false;
        });

        navigate();
      }
    }); // using this listener, you can get the medium of connection as well.
    /*FacebookAudienceNetwork.init(
      testingId: "9415d081-9c2b-4cad-9326-23389d96fc9c",
      iOSAdvertiserTrackingEnabled: true,
    );*/
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    internetConnection!.cancel();
    //cancel internet connection subscription after you are done
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          color: Color(0xff161922),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset(
                  "assets/images/camera.png",
                  scale: 5,
                ),
                SizedBox(height: 2.h),
                Text("Global Video Call",
                    style: Styles.appBarStyle.copyWith(
                      fontSize: 26.sp,
                    )),
                Text(
                    textAlign: TextAlign.center,
                    "Global Call will help you to meet new people daily and for video chats with them",
                    style: Styles.findExactSame.copyWith(
                        fontWeight: FontWeight.w500, fontSize: 12.sp)),
                Spacer(),
                Center(child: SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.white : Colors.grey,
                      ),
                    );
                  },
                )),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ));
  }

  Widget errorMsg(String text, bool show) {
    if (show == true) {
      return Container(
        padding: EdgeInsets.all(10.00),
        margin: EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(right: 6.00),
            child: Icon(Icons.info, color: Colors.white),
          ), // icon for error message

          Text(text, style: TextStyle(color: Colors.white)),
        ]),
      );
    } else {
      return Container();
    }
  }
}
