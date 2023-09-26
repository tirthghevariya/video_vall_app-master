import 'dart:async';
import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:video_vall_app/Resources/app_style.dart';

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
  int selectedCameraIndex = 0; // 0 for back camera, 1 for front camera

  @override
  void initState() {
    var data = Get.arguments;
    log('weiuwethiuweth$data');
    if (data != null) {
      _controller = VideoPlayerController.network(data['url']);
      _initializeVideoPlayerFuture = _controller!.initialize().then((_) {
        setState(() {});
      });
      _controller!.play();
    } else {
      log('Error: widget.url is null');
    }
    _initializeCamera();
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
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
                        color: Colors.black,
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
                                      borderRadius: BorderRadius.circular(3.w)),
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
                                  Navigator.pop(context);
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
                                    direction == 0
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
