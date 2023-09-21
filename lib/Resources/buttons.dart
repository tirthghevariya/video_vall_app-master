import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// import '../Pages/Onboarding/slashscreen1.dart';
import 'app_style.dart';

class Buttonproceed extends StatelessWidget {
  bool? checkDetails;
  IconData? icon;
  VoidCallback ontap;
  String text;
  bool? checkIcon;
  Buttonproceed(
      {required this.ontap,
      required this.text,
      this.checkDetails,
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
            color: checkDetails == true || checkDetails == null
                ? Styles.primaryBlueColor
                : const Color(0XFFD2D8E8).withOpacity(0.3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Styles.heading2obs.copyWith(color: Colors.white),
            ),
            checkIcon == null
                ? Icon(
                    icon ?? Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 4.w,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class ButtonProceed1 extends StatelessWidget {
  bool? checkDetails;
  VoidCallback ontap;
  String text;
  TextStyle style;
  Color? buttonColor;
  ButtonProceed1(
      {required this.ontap,
      required this.text,
      this.checkDetails,
      required this.style,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 7.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: buttonColor == null ? Styles.primaryBlueColor : buttonColor),
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
