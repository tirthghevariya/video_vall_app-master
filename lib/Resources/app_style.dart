import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Styles {
  //background color
  static Color backgroundcolor = Color(0XFFF1F5F9);
  //Colors
  static Color primarygreencolor = Color(0XFF1DAB87);
  static Color primarybluecolor = Color(0XFF1B386E);
  static Color primarynormaltextcolor = Color(0XFF49608B);
  static Color colorlverylightblue = Color(0XFF8F9DC5);
  static Color colorformtextblue = Color(0XFFD2D8E8);
  static Color colorformblue = Color(0XFFD2D8E8).withOpacity(0.3);
  static Color colorPaymentBackground = Color(0XFFF1F5F9);
  static Color appBarWhite = Colors.white;

  //names in the send money screen
  static Color colorTextSendMoney = Color(0XFF334155);
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
  static TextStyle normaltextobs = TextStyle(
      fontFamily: "Poppins", fontWeight: FontWeight.normal, fontSize: 1.8.h);

  //16 semibold
  static TextStyle heading2form = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: 2.h,
      color: Styles.colorformtextblue);

  //12 normal and medium dashboard and semibold
  static TextStyle heading3db = TextStyle(
      fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 1.5.h);

//10 medium and also use for regular 10
  static TextStyle heading4db = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 1.42.h,
      color: Color(0XFF8F9DC5));

  static TextStyle appBarStyle = GoogleFonts.montserrat(
      fontWeight: FontWeight.bold, fontSize: 12.sp, color: appBarWhite);

  static TextStyle commonButtonTheme = GoogleFonts.montserrat(
      color: appBarWhite, fontWeight: FontWeight.bold, fontSize: 12.sp);

  static TextStyle findExactSame = GoogleFonts.montserrat(
      fontSize: 20.sp, color: Colors.grey, fontWeight: FontWeight.w500);

  //14 medium and bold and everything of the dashbpard

  //padding
  // padding: EdgeInsets.symmetric(horizontal: 10.w),
//icon size
//   size: 7.w

// mobile height 845px
//mobile widht 410px
}
