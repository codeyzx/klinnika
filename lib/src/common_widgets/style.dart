import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

Color secondaryColor = HexColor("#094067");
Color mainBlue = HexColor("#3DA9FC");

TextStyle splashLogoName = GoogleFonts.montserrat(
  color: secondaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 24.sp,
);

TextStyle splashBy = GoogleFonts.montserrat(
    color: HexColor("#606060"),
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    letterSpacing: 0.6.sp);

TextStyle splashTeamName = GoogleFonts.montserrat(
    color: mainBlue,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    letterSpacing: 0.48.sp);

TextStyle onBoardTitle = GoogleFonts.montserrat(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 20.sp,
);


TextStyle onBoardSubTitle = GoogleFonts.montserrat(
  color: Colors.black.withOpacity(0.80),
  fontWeight: FontWeight.w300,
  fontSize: 16.sp,
);

TextStyle onBoardBtnText = GoogleFonts.montserrat(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    );

TextStyle onBoardUnBtnText = GoogleFonts.montserrat(
  color: mainBlue,
  fontWeight: FontWeight.w600,
  fontSize: 16.sp,
);
