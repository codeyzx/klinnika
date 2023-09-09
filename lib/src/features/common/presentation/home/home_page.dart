import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/home/home_controller.dart';
import 'package:klinnika/src/features/queue/presentation/detail_patient/detail_patient_page.dart';
import 'package:klinnika/src/routes/routes.dart';
import 'package:klinnika/src/shared/extensions/build_context.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final controller = ref.read(homeControllerProvider.notifier);
    final queue = state.home?.queueList;
    return AsyncValueWidget(
      value: state.homeValue,
      data: (value) {
        return StatusBarWidget(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60.h,
                            ),
                            Text(
                              'Antrian Pasien',
                              style: TypographyApp.queueBigTitle,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              'Jadwal hari ini: 08.00 - 16.00',
                              style: TypographyApp.queueScheduleToday,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.black.withOpacity(.2),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            fixedSize: Size(344.w, 55.h),
                            side: BorderSide(
                              color: HexColor('#929DAB'),
                              width: 0.5.w,
                            ),
                            shadowColor: ColorApp.black.withOpacity(0.20),
                            backgroundColor: ColorApp.white,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 14.w,
                              ),
                              Text(
                                "02 September 2023",
                                style: TypographyApp.queueScheduleSelect,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   height: 50.h,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(10),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.black.withOpacity(.1),
                        //         blurRadius: 10,
                        //         offset: const Offset(0, 5),
                        //       ),
                        //     ],
                        //   ),
                        //   child: InkWell(
                        //     onTap: () {},
                        //     child: Container(
                        //       height: double.infinity,
                        //       width: 50,
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         border: Border.all(color: Colors.black.withOpacity(.2)),
                        //       ),
                        //       child: Row(
                        //         children: [
                        //           Expanded(
                        //             child: Center(
                        //               child: Text(
                        //                 '${state.user?.name} - 21 Juli 2021',
                        //                 style: const TextStyle(
                        //                   color: Colors.black,
                        //                   fontSize: 16,
                        //                   fontWeight: FontWeight.w500,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             height: double.infinity,
                        //             width: 50,
                        //             child: Icon(
                        //               Icons.arrow_drop_down,
                        //               color: Colors.black,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 120.w,
                              height: 26.h,
                              decoration: BoxDecoration(
                                color: ColorApp.secondaryBlue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14.r),
                                  topRight: Radius.circular(14.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Antrian Saat Ini",
                                  style: TypographyApp.queueScheduleLabel,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 71.h,
                              decoration: BoxDecoration(
                                color: ColorApp.primary,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4.r),
                                  bottomRight: Radius.circular(4.r),
                                  topRight: Radius.circular(4.r),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 13.w,
                                      ),
                                      CircleAvatar(
                                        radius: 25.r,
                                        backgroundImage: NetworkImage(
                                            "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                                      ),
                                      SizedBox(
                                        width: 13.w,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Ahmad Joni",
                                            style:
                                                TypographyApp.queueListNameOn,
                                          ),
                                          Text(
                                            "No. antrian: 1",
                                            style: TypographyApp.queueListNumOn,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => DetailPatientPage()));
                                    },
                                    child: Container(
                                      width: 36.w,
                                      height: 36.h,
                                      margin: EdgeInsets.only(right: 13.w),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: ColorApp.secondaryBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.2.w, color: HexColor('#929DAB')),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      CircleAvatar(
                                        radius: 22.r,
                                        backgroundImage: NetworkImage(
                                            "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        height: 20.h,
                                        width: 1.w,
                                        color: HexColor('#929DAB'),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Peris",
                                            style: TypographyApp.queueListNameOff,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "No. antrian: ",
                                                style: TypographyApp.queueListNumOffLabel,
                                              ),Text(
                                                "2",
                                                style: TypographyApp.queueListNumOffValue,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => DetailPatientPage()));
                                    },
                                    child: Container(
                                      width: 30.w,
                                      height: 30.h,
                                      margin: EdgeInsets.only(right: 10.w),
                                      decoration: BoxDecoration(
                                        color: ColorApp.primary.withOpacity(0.10),
                                        borderRadius: BorderRadius.circular(4.r),
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: ColorApp.secondaryBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h,),
                            ],
                          ),
                        ),
                        SizedBox(height: 150.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  context.pushNamed(Routes.login.name);
                                },
                                child: const Text('Go to Login')),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                onPressed: () {
                                  controller.logout();
                                },
                                child: const Text('Logout')),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: queue?.length ?? 0,
                          itemBuilder: (context, index) {
                            final item = queue?[index];

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item?.user.name ?? '',
                                          style: TypographyApp.text1,
                                        ),
                                        Text(
                                          item?.complaintType ?? '',
                                          style: TypographyApp.text2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
