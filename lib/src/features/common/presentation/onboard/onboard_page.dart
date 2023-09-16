import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:klinnika/gen/assets.gen.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/common_controller.dart';
import 'package:klinnika/src/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardPage extends ConsumerWidget {
  const OnboardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commonControllerProvider);
    final controllerState = ref.read(commonControllerProvider.notifier);
    final controller = PageController();

    return StatusBarWidget(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              controllerState.setLastPage(index == 2);
            },
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 230.h,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 1.h,
                          left: 0,
                          child: Assets.images.ellipseImg1.image(
                            height: 180.h,
                          ),
                        ),
                        Positioned(
                          top: 15.h,
                          right: 0,
                          child: Assets.images.ellipseImg2.image(
                            height: 180.h,
                          ),
                        ),
                        Positioned(
                          bottom: 50.h,
                          right: 110.w,
                          child: Assets.images.ellipseImg3.image(
                            height: 50.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Assets.images.onboardImg1.image(
                      width: 236.26.w,
                      height: 211.91.h,
                    ),
                  ),
                  SizedBox(
                    height: 13.46.h,
                  ),
                  Text(
                    "Lihat Jadwal Anda",
                    style: TypographyApp.onBoardTitle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Ketahui jadwal praktek anda\ndengan cepat",
                    style: TypographyApp.onBoardSubTitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 230.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 15.h,
                          left: 0,
                          child: Assets.images.ellipseImg1.image(
                            height: 180.h,
                          ),
                        ),
                        Positioned(
                          top: 15.h,
                          right: 0,
                          child: Assets.images.ellipseImg2.image(
                            height: 180.h,
                          ),
                        ),
                        Positioned(
                          bottom: 40.h,
                          left: 117.w,
                          child: Assets.images.ellipseImg3.image(
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Assets.images.onboardImg2.image(
                      width: 132.48.w,
                      height: 215.16.h,
                    ),
                  ),
                  SizedBox(
                    height: 13.46.h,
                  ),
                  Text(
                    "Lihat Antrean Pasien",
                    style: TypographyApp.onBoardTitle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Lihat antrean pasien lanjutan\ndengan mudah",
                    style: TypographyApp.onBoardSubTitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 230.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 15.h,
                          left: 0,
                          child: Assets.images.ellipseImg1.image(
                            height: 180.h,
                          ),
                        ),
                        Positioned(
                          bottom: 1.h,
                          right: 0,
                          child: Assets.images.ellipseImg2.image(
                            height: 180.h,
                          ),
                        ),
                        Positioned(
                          bottom: 40.h,
                          right: 117.w,
                          child: Assets.images.ellipseImg3.image(
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Assets.images.onboardImg3.image(
                      width: 254.23.w,
                      height: 199.03.h,
                    ),
                  ),
                  SizedBox(
                    height: 13.46.h,
                  ),
                  Text(
                    "Akses Rekam Medis Pasien",
                    style: TypographyApp.onBoardTitle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Akses informasi rekam medis\nuntuk kemudahan lebih",
                    style: TypographyApp.onBoardSubTitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomSheet: state.isLastPage
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
                          activeDotColor: ColorApp.primary,
                          dotColor: ColorApp.primary.withOpacity(0.30),
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
                      height: 50.h,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(ColorApp.primary),
                        ),
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                          context.goNamed(Routes.login.name);
                        },
                        child: Text(
                          'Mulai Sekarang',
                          style: TypographyApp.onBoardBtnText,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
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
                          activeDotColor: ColorApp.primary,
                          dotColor: ColorApp.primary.withOpacity(0.30),
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
                          height: 50.h,
                          child: TextButton(
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                            child: Text(
                              'Lewati',
                              style: TypographyApp.onBoardUnBtnText,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                          height: 50.h,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(ColorApp.primary),
                            ),
                            onPressed: () {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              'Lanjut',
                              style: TypographyApp.onBoardBtnText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
