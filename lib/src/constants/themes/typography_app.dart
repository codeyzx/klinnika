import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class TypographyApp {
  static TextStyle headline1 = TextStyle(
    fontSize: ScreenUtil().setSp(26),
    fontWeight: FontWeight.w700,
    color: ColorApp.black,
  );

  static TextStyle headline2 = TextStyle(
    fontSize: ScreenUtil().setSp(22),
    fontWeight: FontWeight.w700,
    color: ColorApp.black,
  );

  static TextStyle headline3 = TextStyle(
    fontSize: ScreenUtil().setSp(18),
    fontWeight: FontWeight.w600,
    color: ColorApp.black,
  );

  static TextStyle text1 = TextStyle(
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.w500,
    color: ColorApp.black,
  );

  static TextStyle text2 = TextStyle(
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.w400,
    color: ColorApp.black,
  );

  static TextStyle subText1 = TextStyle(
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w300,
    color: ColorApp.black,
  );

  static TextStyle splashLogoName = TextStyle(
    color: ColorApp.secondary,
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
  );

  static TextStyle splashBy =
      TextStyle(color: ColorApp.splash, fontWeight: FontWeight.w500, fontSize: 12.sp, letterSpacing: 0.6.sp);

  static TextStyle splashTeamName =
      TextStyle(color: ColorApp.primary, fontWeight: FontWeight.w600, fontSize: 16.sp, letterSpacing: 0.48.sp);

  static TextStyle onBoardTitle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );

  static TextStyle onBoardSubTitle = TextStyle(
    color: Colors.black.withOpacity(0.80),
    fontWeight: FontWeight.w300,
    fontSize: 16.sp,
  );

  static TextStyle onBoardBtnText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );

  static TextStyle onBoardUnBtnText = TextStyle(
    color: ColorApp.primary,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );

  static TextStyle loginAppName = TextStyle(
    color: ColorApp.secondaryBlue,
    fontWeight: FontWeight.w700,
    fontSize: 30.sp,
  );

  static TextStyle loginTitle = TextStyle(
    color: ColorApp.black,
    fontWeight: FontWeight.w500,
    fontSize: 30.sp,
  );

  static TextStyle loginBtn= TextStyle(
    color: ColorApp.white,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );

  static TextStyle loginOffInput= TextStyle(
    color: HexColor('#9D9D9D'),
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );

  static TextStyle loginOnInput= TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );

  static TextStyle loginForgot= TextStyle(
    color: ColorApp.primary,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static TextStyle queueAppbarSmall = GoogleFonts.montserrat(
    color: ColorApp.secondaryBlue,
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
  );
  static TextStyle queueOnBtn = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
  static TextStyle queueDetName= GoogleFonts.montserrat(
    color: ColorApp.secondaryBlue,
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
  );
  static TextStyle queueDetNum = GoogleFonts.montserrat(
    color: ColorApp.secondaryBlue,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static TextStyle queueOnWhiteBtn = GoogleFonts.montserrat(
    color: ColorApp.primary,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
  static TextStyle queueDetLabel = GoogleFonts.montserrat(
    color: HexColor('#5F6C7B'),
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static TextStyle queueDetValue = GoogleFonts.montserrat(
    color: ColorApp.secondaryBlue,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
  static TextStyle queueDetTitle = GoogleFonts.montserrat(
    color: ColorApp.secondaryBlue,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
  static TextStyle queueDetIll = GoogleFonts.montserrat(
    color: ColorApp.primary,
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
  );
  static TextStyle queueDesc = GoogleFonts.montserrat(
    color: HexColor('#5F6C7B'),
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
  );
  static TextStyle queueBigTitle = GoogleFonts.montserrat(
    color: ColorApp.secondaryBlue,
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
  );
  static TextStyle queueScheduleToday = GoogleFonts.montserrat(
    color: ColorApp.secondaryBlue,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static TextStyle queueScheduleSelect = GoogleFonts.montserrat(
    color: ColorApp.secondaryBlue,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
  static TextStyle queueScheduleLabel = GoogleFonts.montserrat(
    color: HexColor('#FFFFFE'),
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
  );
  static TextStyle queueListNameOn = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );
  static TextStyle queueListNumOn= GoogleFonts.montserrat(
    color: Colors.white.withOpacity(0.80),
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static TextStyle queueListNameOff = GoogleFonts.montserrat(
    color: HexColor('#5F6C7B'),
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
  );
  static TextStyle queueListNumOffLabel= GoogleFonts.montserrat(
    color: HexColor('#929DAB'),
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
  );
  static TextStyle queueListNumOffValue= GoogleFonts.montserrat(
    color: HexColor('#5F6C7B'),
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
  );
  static TextStyle queueMRTitle= GoogleFonts.montserrat(
    color: ColorApp.secondaryBlue,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
}
