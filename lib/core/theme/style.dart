import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_color.dart';

class AppTextStyle{
  static TextStyle size22boldBlackTextColor = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: "Poppins",
    color: AppColor.blackTextColor,
  );

  static TextStyle size12MediumBlackTextColor = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
    color:AppColor.blackTextColor,
  );

  
  static TextStyle size16SimBoldWhiteColor= const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: "Poppins",
    color:AppColor.whiteColor,
  );

    static TextStyle size10BoldWhiteColor= const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    color:AppColor.whiteColor,
  );

}