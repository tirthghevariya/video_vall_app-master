import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_vall_app/Resources/app_style.dart';

class MatchCallScreen extends StatefulWidget {
  const MatchCallScreen({Key? key}) : super(key: key);

  @override
  State<MatchCallScreen> createState() => _MatchCallScreenState();
}

class _MatchCallScreenState extends State<MatchCallScreen> {
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
      body: Column(
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
            'Mutual sympathy.Do not waste time\n and write to her',
            textAlign: TextAlign.center,
            style: Styles.findExactSame
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 2.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Styles.primaryColor,
              fixedSize: Size(40.w, 6.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onPressed: () {
              // Get.toNamed(RoutesName.catGallery);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Match Now",
                  style: Styles.commonButtonTheme.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
