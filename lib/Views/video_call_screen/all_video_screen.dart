import 'dart:async';
import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:video_vall_app/Resources/Routes/routes_name.dart';
import 'package:video_vall_app/helper/facebook_admanager.dart';
import '../../Resources/app_style.dart';

class VideoCallScreen extends StatefulWidget {
  final String? url;
  const VideoCallScreen({Key? key, this.url}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  int direction = 0;
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  late List<CameraDescription> cameras;
  late CameraController _cameraController;
  int selectedCameraIndex = 1;
  bool isSecureMode = false;
  dynamic data;
  @override
  void initState() {
    data = Get.arguments;
    if (data != null) {
      _controller = VideoPlayerController.network(data['url']);
      _initializeVideoPlayerFuture = _controller!.initialize().then((_) {
        _controller!.addListener(() {
          if (_controller!.value.position >= _controller!.value.duration) {
            _controller!.seekTo(Duration.zero);
            _controller!.play();
          }
        });
      });
      _controller!.play();
    } else {
      log('Error: widget.url is null');
    }
    _initializeCamera();
    FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_SECURE,
    );
    super.initState();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[selectedCameraIndex],
      ResolutionPreset.medium,
    );
    await _cameraController.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleCamera() {
    setState(() {
      selectedCameraIndex = selectedCameraIndex == 0 ? 1 : 0;
      _cameraController = CameraController(
        cameras[selectedCameraIndex],
        ResolutionPreset.medium,
      );
      _cameraController.initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SizedBox(
        height: 32.h,
        width: 60.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 8.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Styles.primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 12.w,
                    height: 12.w,
                    image: const AssetImage(
                      'assets/images/caution.png',
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Report',
                    style: Styles.appBarStyle.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Center(
                child: Text(
                  'Report and Block This User for Violation',
                  textAlign: TextAlign.center,
                  style: Styles.appBarStyle.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Styles.primaryColor,
                      borderRadius: BorderRadius.circular(3.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.5.h, horizontal: 7.w),
                      child: Text(
                        'Yes',
                        style: Styles.appBarStyle,
                      ),
                    ),
                  ),
                  onTap: () async {
                    Get.find<FacebookAdController>()
                        .showFacebookInterstitialAd();

                    Navigator.of(context).popUntil((route) {
                      return route.settings.name == RoutesName.matchCall;
                    });
                  },
                ),
                SizedBox(
                  width: 8.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).popUntil(
                      (route) {
                        return route.settings.name == RoutesName.matchCall;
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Styles.primaryColor,
                      borderRadius: BorderRadius.circular(3.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.5.h, horizontal: 7.w),
                      child: Text(
                        'NO',
                        style: Styles.appBarStyle,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          color: const Color(0xff161922),
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    SizedBox(
                      height: 90.h,
                      width: 100.w,
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(
                          _controller!,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12.h,
                      right: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            4.w), // Specify the border radius here
                        child: Container(
                          height: 25.h,
                          width: 35.w,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: CameraPreview(
                            _cameraController,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff161922),
                        ),
                        height: 10.h,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(3.w)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.7.h, horizontal: 6.w),
                                      child: Icon(
                                        Icons.call_end,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            errorDialog);
                                    // Navigator.pop(context);
                                  }),
                              SizedBox(
                                width: 8.w,
                              ),
                              InkWell(
                                onTap: _toggleCamera,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Styles.appBarWhite,
                                      borderRadius: BorderRadius.circular(3.w)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0.7.h, horizontal: 6.w),
                                    child: Icon(
                                      selectedCameraIndex == 0
                                          ? Icons
                                              .camera_alt_outlined // Show the front camera icon
                                          : Icons
                                              .flip_camera_ios_outlined, // Show the back camera icon
                                      color: Colors.black,
                                      size: 24.sp,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.white : Colors.grey,
                      ),
                    );
                  },
                ));
              }
            },
          ),
        ),
        // ),
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    _cameraController.dispose();
    super.dispose();
  }
}
