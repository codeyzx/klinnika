import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/history/presentation/history_detail_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Text(
                'Riwayat Pemeriksaan',
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
                thickness: 0.6.h,
                color: HexColor('#929DAB'),
              ),
              SizedBox(
                height: 16.h,
              ),
              ElevatedButton(
                onPressed: () {},
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 14.w,
                    ),
                    Text(
                      "Semua Tanggal",
                      style: TypographyApp.queueScheduleSelect,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: HexColor('#5F6C7B'),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Hari ini",
                style: TypographyApp.historyDay,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HistoryDetailPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(344.w, 65.h),
                    side: BorderSide(
                      color: HexColor('#929DAB'),
                      width: 0.5.w,
                    ),
                    shadowColor: ColorApp.black.withOpacity(0.20),
                    backgroundColor: ColorApp.white,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 12.w,
                          ),
                          CircleAvatar(
                            radius: 23.r,
                            backgroundImage: const NetworkImage(
                                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  'Friscka',
                                  style: TypographyApp.historyName,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "RM-28",
                                style: TypographyApp.historyMedRec,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "13:02",
                            style: TypographyApp.historyClock,
                          ),
                          SizedBox(
                            width: 12.w,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Kemarin",
                style: TypographyApp.historyDay,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HistoryDetailPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(344.w, 65.h),
                    side: BorderSide(
                      color: HexColor('#929DAB'),
                      width: 0.5.w,
                    ),
                    shadowColor: ColorApp.black.withOpacity(0.20),
                    backgroundColor: ColorApp.white,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 12.w,
                          ),
                          CircleAvatar(
                            radius: 23.r,
                            backgroundImage: const NetworkImage(
                                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  'John',
                                  style: TypographyApp.historyName,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "RM-99",
                                style: TypographyApp.historyMedRec,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Kemarin",
                            style: TypographyApp.historyClock,
                          ),
                          SizedBox(
                            width: 12.w,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Lawas",
                style: TypographyApp.historyDay,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HistoryDetailPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(344.w, 65.h),
                    side: BorderSide(
                      color: HexColor('#929DAB'),
                      width: 0.5.w,
                    ),
                    shadowColor: ColorApp.black.withOpacity(0.20),
                    backgroundColor: ColorApp.white,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 12.w,
                          ),
                          CircleAvatar(
                            radius: 23.r,
                            backgroundImage: const NetworkImage(
                                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  'Ahmad Joni',
                                  style: TypographyApp.historyName,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "RM-20",
                                style: TypographyApp.historyMedRec,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "20/8/23",
                            style: TypographyApp.historyClock,
                          ),
                          SizedBox(
                            width: 12.w,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
