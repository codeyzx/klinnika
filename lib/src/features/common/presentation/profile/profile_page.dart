import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/schedule/schedule_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              SizedBox(height: 60.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: const NetworkImage(
                        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220.w,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Dr. Tirta',
                              style: TypographyApp.queueDetName,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Dokter Poli Umum",
                        style: TypographyApp.profileJob,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                width: 1.sw,
                height: 0.6.h,
                color: HexColor('#929DAB'),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text("Akunmu", style: TypographyApp.profileItemTitle,),
              SizedBox(height: 18.h,),
              InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.person_rounded, color: HexColor('#5F6C7B'),),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 300.w,
                      padding: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: HexColor('#E5E5E5'),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Edit Profil",
                            style: TypographyApp.profileItem,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: HexColor('#606060'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h,),
              InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lock_rounded, color: HexColor('#5F6C7B'),),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 300.w,
                      padding: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: HexColor('#E5E5E5'),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ubah Password",
                            style: TypographyApp.profileItem,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: HexColor('#606060'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h,),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SchedulePage()),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.calendar_month_rounded, color: HexColor('#5F6C7B'),),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 300.w,
                      padding: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: HexColor('#E5E5E5'),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lihat Jadwal",
                            style: TypographyApp.profileItem,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: HexColor('#606060'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h,),
              Text("Bantuan", style: TypographyApp.profileItemTitle,),
              SizedBox(height: 18.h,),
              InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.email_rounded, color: HexColor('#5F6C7B'),),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 300.w,
                      padding: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: HexColor('#E5E5E5'),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kontak",
                            style: TypographyApp.profileItem,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: HexColor('#606060'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h,),
              InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.report_rounded, color: HexColor('#5F6C7B'),),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 300.w,
                      padding: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: HexColor('#E5E5E5'),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Laporkan Masalah",
                            style: TypographyApp.profileItem,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: HexColor('#606060'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h,),
              Text("Lainnya", style: TypographyApp.profileItemTitle,),
              SizedBox(height: 18.h,),
              InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.library_books_rounded, color: HexColor('#5F6C7B'),),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 300.w,
                      padding: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: HexColor('#E5E5E5'),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ketentuan Layanan",
                            style: TypographyApp.profileItem,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: HexColor('#606060'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 18.h,),
              InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.logout_rounded, color: HexColor('#DB3F3F'),),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 300.w,
                      padding: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: HexColor('#E5E5E5'),
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Keluar",
                            style: TypographyApp.profileItemRed,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: HexColor('#DB3F3F'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
