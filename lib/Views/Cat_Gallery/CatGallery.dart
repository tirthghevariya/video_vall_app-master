// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_vall_app/Resources/app_style.dart';

class CategoryGallery extends StatefulWidget {
  const CategoryGallery({Key? key}) : super(key: key);

  @override
  State<CategoryGallery> createState() => _CategoryGalleryState();
}

class _CategoryGalleryState extends State<CategoryGallery> {
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
        backgroundColor: Styles.primaryColor,
        leading: BackButton(color: Styles.appBarWhite),
        leadingWidth: 5.w,
        title: Text(
          "Live Video Call",
          style: Styles.appBarStyle,
        ),
      ),
      body: SizedBox(
        child: Stack(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 20.h,
                  left: 10.w,
                  child: Text(
                    "Find exactly the",
                    textAlign: TextAlign.center,
                    style: Styles.findExactSame,
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
                      // Get.toNamed(RoutesName.GenderSelection);
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
