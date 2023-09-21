import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import 'app_style.dart';

// PhoneScreenController phoneScreenController=Get.find();
class FeaturesWidget extends StatelessWidget {
  String value;
  String image;
  Color color;
  FeaturesWidget(
      {required this.value, required this.image, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(image),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          value,
          style: Styles.heading4db.copyWith(
              fontWeight: FontWeight.normal, color: Color(0XFF64748B)),
        )
      ],
    );
  }
}

class backWidget extends StatelessWidget {
  VoidCallback onTap;
  backWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.arrow_back_ios,
        color: Styles.primaryNormalTextColor,
        size: 3.3.h,
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  String value;
  String image;
  CircleWidget({required this.value, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          minRadius: 4.h,
          backgroundColor: Color(0XFFF1F5F9),
          child: Image.asset(image),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          value,
          style: Styles.heading4db,
        )
      ],
    );
  }
}

class WidgetAlertText extends StatelessWidget {
  String text;
  WidgetAlertText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0XFFD2D8E8).withOpacity(0.7),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Styles.primaryBlueColor,
            size: 7.w,
          ),
          Container(
              width: 280,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Styles.heading3db
                    .copyWith(height: 1.2, color: Styles.primaryBlueColor),
              ))
        ],
      ),
    );
  }
}

class TextNumberField {
  static String? validatorNumberField(value) {
    if (value!.isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r'^\+?\d{10,12}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // static InputDecoration inputDecorationNumberField() {
  //    return InputDecoration(
  //        prefixIcon: SizedBox(
  //          width: 22.9.w,
  //          child: Row(
  //            children: [
  //              SizedBox(
  //                width: 1.95.w,
  //              ),
  //              SizedBox(
  //                width: 20.7.w,
  //                child: DropdownButton(
  //                  underline: SizedBox(),
  //
  //                  // isExpanded: true,
  //                  iconSize: 0,
  //                  hint: Row(
  //                    children: [
  //                      Obx(
  //                            () => Text(
  //                            "${phoneScreenController.vaarstartnum.value}",
  //                            style: Styles.heading2obs
  //                                .copyWith(
  //                                color: Styles
  //                                    .primarybluecolor,
  //                                fontWeight:
  //                                FontWeight.w700)),
  //                      ),
  //                      Icon(
  //                        Icons.arrow_drop_down_sharp,
  //                        color: Styles.primarybluecolor,
  //                      ),
  //                      SizedBox(
  //                        height: 5.h,
  //                        child: VerticalDivider(
  //                          thickness: 0.3.w,
  //                          color: Color(0XFFD2D8E8),
  //                        ),
  //                      ),
  //                    ],
  //                  ),
  //                  // value: dropdownvalue,
  //                  borderRadius: BorderRadius.circular(7),
  //
  //                  items: phoneScreenController?.listNum
  //                      .map((String items) {
  //                    return DropdownMenuItem(
  //                      value: items,
  //                      child: Padding(
  //                        padding: const EdgeInsets.all(8),
  //                        child: Row(
  //                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                          children: [
  //                            Text(
  //                              items,
  //                              style: TextStyle(),
  //                            ),
  //                          ],
  //                        ),
  //                      ),
  //                    );
  //                  }).toList(),
  //                  onChanged: (value) {
  //                    // phoneScreenController?.setCountryCode(
  //                    //     code: value.toString());
  //                  },
  //                ),
  //              ),
  //            ],
  //          ),
  //        ),
  //        filled: true,
  //        fillColor: Styles.colorformblue,
  //        contentPadding: EdgeInsets.symmetric(
  //            vertical: 1.8.h, horizontal: 3.w),
  //        border: OutlineInputBorder(
  //          borderRadius: BorderRadius.circular(1.18.h),
  //        ),
  //        enabledBorder: OutlineInputBorder(
  //            borderRadius: BorderRadius.circular(1.18.h),
  //            borderSide: BorderSide(width: 1,color:Styles.colorformblue )
  //        ),
  //        focusedBorder:OutlineInputBorder(
  //            borderRadius: BorderRadius.circular(1.18.h),
  //            borderSide: BorderSide(width: 1,color:Styles.colorformblue )
  //        ),
  //        hintStyle: Styles.heading2form,
  //        // border: InputBorder.none,
  //        hintText: "00000 00000");
  //  }

  static TextStyle inputStyle =
      Styles.heading2obs.copyWith(color: Styles.primaryBlueColor);
}

class TextNameField {
  static TextStyle inputStyle =
      Styles.heading2obs.copyWith(color: Styles.primaryBlueColor);
  static InputDecoration inputDecorationNameField(
      {required String name, IconData? iconData}) {
    return InputDecoration(
        filled: true,
        fillColor: Styles.colorFormBlue,
        contentPadding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 3.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.18.h),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.18.h),
            borderSide: BorderSide(width: 1, color: Styles.colorFormBlue)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.18.h),
            borderSide: BorderSide(width: 1, color: Styles.colorFormBlue)),
        prefixIcon: Icon(iconData),
        hintText: name,
        hintStyle: Styles.heading2form

        // labelText: 'Name',
        );
  }
}

class TextPinField {
  static TextStyle inputStyle =
      Styles.heading2obs.copyWith(color: Styles.primaryBlueColor);
  static String? validatorPinField(value) {
    if (value!.isEmpty) {
      return 'Please enter your pin code';
    } else if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return 'Please enter a valid pin code';
    }
    print("deone");
    return null;
  }

  static InputDecoration inputDecorationPinField() {
    return InputDecoration(
        filled: true,
        fillColor: Styles.colorFormBlue,
        contentPadding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 4.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.18.h),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.18.h),
            borderSide: BorderSide(width: 1, color: Styles.colorFormBlue)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.18.h),
            borderSide: BorderSide(width: 1, color: Styles.colorFormBlue)),
        hintText: "000000",
        hintStyle: Styles.heading2form

        // labelText: 'Name',
        );
  }
}

class AddressFormField {
  static TextStyle inputStyle =
      Styles.heading2obs.copyWith(color: Styles.primaryBlueColor);
  static String? validatorAddressField(value) {
    if (value!.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  static InputDecoration inputDecorationAddressField() {
    return InputDecoration(
        filled: true,
        fillColor: Styles.colorFormBlue,
        contentPadding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 3.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.18.h),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.18.h),
            borderSide: BorderSide(width: 1, color: Styles.colorFormBlue)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.18.h),
            borderSide: BorderSide(width: 1, color: Styles.colorFormBlue)),
        hintText: "Enter your address...",
        hintStyle: Styles.heading2form

        // labelText: 'Name',
        );
  }
}

class AdharFormField {
  static TextStyle inputStyle =
      Styles.heading2obs.copyWith(color: Styles.primaryBlueColor);
  static String? validatorAdharFormField(value) {
    if (value!.isEmpty) {
      return 'Please enter your Aadhaar number';
    }
    if (value!.length != 14) {
      return 'Aadhaar number should be 12 digits';
    }
    if (!RegExp(r'^[2-9]\d{3}\s\d{4}\s\d{4}$').hasMatch(value!)) {
      return 'Please enter a valid Aadhaar number';
    }
    return null;
  }

  static InputDecoration inputDecorationAdharFormField() {
    return InputDecoration(
        filled: true,
        fillColor: Styles.colorFormBlue,
        contentPadding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 3.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.18.h),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.18.h),
            borderSide: BorderSide(width: 1, color: Styles.colorFormBlue)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.18.h),
            borderSide: BorderSide(width: 1, color: Styles.colorFormBlue)),
        hintText: "0000 0000 0000",
        hintStyle: Styles.heading2form

        // labelText: 'Name',
        );
  }
}
