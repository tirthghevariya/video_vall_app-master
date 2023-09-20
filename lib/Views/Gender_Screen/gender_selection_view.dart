// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:video_vall_app/Resources/app_style.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: BackButton(color: Styles.appBarWhite),
        leadingWidth: 5.w,
        title: Text("Live Video Call", style: Styles.appBarStyle),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 10.w),
          child: Stack(
            children: [
              Positioned(
                top: 20.h,
                child: Text(
                  textAlign: TextAlign.center,
                  "Find exactly the",
                  style: Styles.findExactSame,
                ),
              ),
            ],
          )
          // Column(
          //   children: [
          //     Image.asset(
          //       "assets/images/person1.png",
          //       // scale: 5,
          //     ),
          //     Text(
          //       "It's Match",
          //       style: GoogleFonts.montserrat(
          //           fontSize: 25,
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold),
          //     ),
          //     Text(
          //       textAlign: TextAlign.center,
          //       "Chat get to know each other and first face-to-face.Enjoy safe discrete Video Calling....",
          //       style: GoogleFonts.montserrat(
          //           // fontSize: 20,
          //           color: Colors.grey,
          //           fontWeight: FontWeight.w500),
          //     ),
          //     Spacer(),
          //     ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.blue,
          //         fixedSize: Size(double.infinity, 30),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(0),
          //         ),
          //       ),
          //       onPressed: () {},
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "Let's Start",
          //             style: Styles.commonButtonTheme,
          //           ),
          //         ],
          //       ),
          //     ),
          //     SizedBox(height: 30)
          //   ],
          // ),
          ),
    );
  }
}
