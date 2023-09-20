import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// import '../Pages/Onboarding/slashscreen1.dart';
import 'app_style.dart';

class Buttonproceed extends StatelessWidget {
  bool? checkdetails;
  IconData? icon;
  VoidCallback ontap;
  String text;
  bool? checkIcon;
  Buttonproceed(
      {required this.ontap,
      required this.text,
      this.checkdetails,
      this.icon,
      this.checkIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 7.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: checkdetails == true || checkdetails == null
                ? Styles.primarybluecolor
                : Color(0XFFD2D8E8).withOpacity(0.3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Styles.heading2obs.copyWith(color: Colors.white),
            ),
            checkIcon == null
                ? Icon(
                    icon == null ? Icons.arrow_forward_ios : icon,
                    color: Colors.white,
                    size: 4.w,
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class Buttonproceed1 extends StatelessWidget {
  bool? checkdetails;
  VoidCallback ontap;
  String text;
  TextStyle style;
  Color? buttoncolor;
  Buttonproceed1(
      {required this.ontap,
      required this.text,
      this.checkdetails,
      required this.style,
      this.buttoncolor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 7.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: buttoncolor == null ? Styles.primarybluecolor : buttoncolor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
