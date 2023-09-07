import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinnika_doctor/src/common_widgets/style.dart';
import 'package:klinnika_doctor/src/features/authenticate/presentation/splash_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(bottom: 77.h),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 372.w,
                    height: 230.h,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 1.h,
                          left: 0,
                          child: Image.asset("assets/images/ellipse_img_1.png", height: 180.h,),
                        ),
                        Positioned(
                          top: 15.h,
                          right: 0,
                          child: Image.asset("assets/images/ellipse_img_2.png", height: 180.h,),
                        ),
                        Positioned(
                          bottom: 50.h,
                          right: 110.w,
                          child: Image.asset("assets/images/ellipse_img_3.png", height: 50.h, width: 50.w,),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset("assets/images/onboard_img_1.png", width: 236.26.w, height: 211.91.h,),
                  ),
                  SizedBox(height: 13.46.h,),
                  Text("Lihat Jadwal Anda", style: onBoardTitle, textAlign: TextAlign.center,),
                  SizedBox(height: 12.h,),
                  Text("Ketahui jadwal praktek anda\ndengan cepat", style: onBoardSubTitle, textAlign: TextAlign.center,),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 372.w,
                    height: 230.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 15.h,
                          left: 0,
                          child: Image.asset("assets/images/ellipse_img_1.png", height: 180.h,),
                        ),
                        Positioned(
                          top: 15.h,
                          right: 0,
                          child: Image.asset("assets/images/ellipse_img_2.png", height: 180.h,),
                        ),
                        Positioned(
                          bottom: 40.h,
                          left: 117.w,
                          child: Image.asset("assets/images/ellipse_img_3.png", height: 30.h, width: 30.w,),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset("assets/images/onboard_img_2.png", width: 132.48.w, height: 215.16.h,),
                  ),
                  SizedBox(height: 13.46.h,),
                  Text("Lihat Antrean Pasien", style: onBoardTitle, textAlign: TextAlign.center,),
                  SizedBox(height: 12.h,),
                  Text("Lihat antrean pasien lanjutan\ndengan mudah", style: onBoardSubTitle, textAlign: TextAlign.center,),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 372.w,
                    height: 230.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 15.h,
                          left: 0,
                          child: Image.asset("assets/images/ellipse_img_1.png", height: 180.h,),
                        ),
                        Positioned(
                          bottom: 1.h,
                          right: 0,
                          child: Image.asset("assets/images/ellipse_img_2.png", height: 180.h,),
                        ),
                        Positioned(
                          bottom: 40.h,
                          right: 117.w,
                          child: Image.asset("assets/images/ellipse_img_3.png", height: 30.h, width: 30.w,),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset("assets/images/onboard_img_3.png", width: 254.23.w, height: 199.03.h,),
                  ),
                  SizedBox(height: 13.46.h,),
                  Text("Akses Rekam Medis Pasien", style: onBoardTitle, textAlign: TextAlign.center,),
                  SizedBox(height: 12.h,),
                  Text("Akses informasi rekam medis\nuntuk kemudahan lebih", style: onBoardSubTitle, textAlign: TextAlign.center,),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
      ? Container(
        padding: EdgeInsets.only(bottom: 52.h, left: 34.w, right: 34.w),
        height: 170.h,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: mainBlue,
                  dotColor: mainBlue.withOpacity(0.30),
                  dotWidth: 12.w,
                  dotHeight: 12.h,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
            ),
            SizedBox(
              width: 320.w,
              height: 42.h,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(mainBlue),
                ),
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ));
                },
                child: Text(
                  'Mulai Sekarang',
                  style: onBoardBtnText,
                ),
              ),
            ),
          ],
        ),
      )
      :Container(
        padding: EdgeInsets.only(bottom: 52.h, left: 34.w, right: 34.w),
        height: 170.h,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: mainBlue,
                  dotColor: mainBlue.withOpacity(0.30),
                  dotWidth: 12.w,
                  dotHeight: 12.h,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120.w,
                  height: 42.h,
                  child: TextButton(
                    onPressed: () {
                      controller.jumpToPage(2);
                    },
                    child: Text(
                      'Lewati',
                      style: onBoardUnBtnText,
                    ),
                  ),
                ),
                SizedBox(
                  width: 120.w,
                  height: 42.h,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(mainBlue),
                    ),
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Lanjut',
                      style: onBoardBtnText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
