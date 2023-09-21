import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Styles {
  //background color
  static Color backgroundColor = const Color(0XFFF1F5F9);
  static Color switchColor = const Color(0XFF45484D);
  static Color primaryColor = const Color(0xff0075F8);
  //Colors
  static Color primaryGreenColor = const Color(0XFF1DAB87);
  static Color primaryBlueColor = const Color(0XFF1B386E);
  static Color primaryNormalTextColor = const Color(0XFF49608B);
  static Color colorVeryLightBlue = const Color(0XFF8F9DC5);
  static Color colorFormTextBlue = const Color(0XFFD2D8E8);
  static Color colorFormBlue = const Color(0XFFD2D8E8).withOpacity(0.3);
  static Color colorPaymentBackground = const Color(0XFFF1F5F9);
  static Color appBarWhite = Colors.white;

  //names in the send money screen
  static Color colorTextSendMoney = const Color(0XFF334155);
  //padding constant
  static EdgeInsets paddingScreen = EdgeInsets.symmetric(horizontal: 7.w);

  //Onboarding heading

  //20
  static TextStyle heading1obs = TextStyle(
      fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 2.5.h);
  //24 semiboald
  static TextStyle heading1otp = TextStyle(
      fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 2.8.h);
  //16
  static TextStyle heading2obs = TextStyle(
      fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 2.h);
  //14
  static TextStyle normalTextObs = TextStyle(
      fontFamily: "Poppins", fontWeight: FontWeight.normal, fontSize: 1.8.h);

  //16 semibold
  static TextStyle heading2form = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: 2.h,
      color: Styles.colorFormTextBlue);

  //12 normal and medium dashboard and semibold
  static TextStyle heading3db = TextStyle(
      fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 1.5.h);

//10 medium and also use for regular 10
  static TextStyle heading4db = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 1.42.h,
      color: const Color(0XFF8F9DC5));

  static TextStyle appBarStyle = GoogleFonts.montserrat(
      fontWeight: FontWeight.bold, fontSize: 14.sp, color: appBarWhite);

  static TextStyle commonButtonTheme = GoogleFonts.montserrat(
      color: appBarWhite, fontWeight: FontWeight.bold, fontSize: 16.sp);

  static TextStyle findExactSame = GoogleFonts.montserrat(
      fontSize: 15.sp, color: Colors.grey, fontWeight: FontWeight.w500);

  //14 medium and bold and everything of the dashbpard

  //padding
  // padding: EdgeInsets.symmetric(horizontal: 10.w),
//icon size
//   size: 7.w

// mobile height 845px
//mobile widht 410px
}
