// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:video_vall_app/Resources/Routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigate() {
    Future.delayed(Duration(seconds: 5), () {
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
      body: (ConnectivityResult.none == true)
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Image.asset(
                      "assets/images/camera.png",
                      scale: 5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Video Call",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      "Global Call will help you to meet new people daily and for video chats with them",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        // leftDotColor: const Color(0xFF1A1A3F),
                        // rightDotColor: const Color(0xFFEA3799),
                        size: 50, color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(title: Text("Check Connection")),
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    child:
                        errorMsg("No Internet Connection Available", isOffLine),
                    //to show internet connection message on offline = true.
                  ),
                  Container(
                      //this is your content
                      margin: EdgeInsets.all(30),
                      width: double.infinity,
                      child: Center(
                          child: Text("Check Connections",
                              style: TextStyle(fontSize: 20))))
                ],
              ))),
    );
  }

  Widget errorMsg(String text, bool show) {
    //error message widget.
    if (show == true) {
      //if error is true then show error message box
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
          //show error message text
        ]),
      );
    } else {
      return Container();
      //if error is false, return empty container.
    }
  }
}
