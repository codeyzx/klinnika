import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';

class DetailPatientPage extends StatefulWidget {
  const DetailPatientPage({super.key});

  @override
  State<DetailPatientPage> createState() => _DetailPatientPageState();
}

class _DetailPatientPageState extends State<DetailPatientPage> {
  String loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorApp.secondaryBlue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Detail Pasien",
          style: TypographyApp.queueAppbarSmall,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahmad Joni",
                        style: TypographyApp.queueDetName,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "Antrian nomor 1",
                        style: TypographyApp.queueDetNum,
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
                height: 1.h,
                color: HexColor('#929DAB'),
              ),
              SizedBox(
                height: 16.h,
              ),
              ElevatedButton(
                child: Text(
                  'Cek Rekam Medis',
                  style: TypographyApp.queueOnWhiteBtn,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(344.w, 50.h),
                  side: BorderSide(
                    color: ColorApp.primary,
                    width: 0.5.w,
                  ),
                  shadowColor: ColorApp.black.withOpacity(0.20),
                  backgroundColor: ColorApp.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 87.w, vertical: 12.h),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Data Pasien",
                style: TypographyApp.queueDetTitle,
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Nama",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    "Ahmad Joni",
                    style: TypographyApp.queueDetValue,
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Tanggal Lahir",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    "30 Oct 2000",
                    style: TypographyApp.queueDetValue,
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Jenis Kelamin",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    "Pria",
                    style: TypographyApp.queueDetValue,
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Email",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    "-",
                    style: TypographyApp.queueDetValue,
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "No. Telp",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    "0821172121",
                    style: TypographyApp.queueDetValue,
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                width: 1.sw,
                height: 1.h,
                color: HexColor('#929DAB'),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Jenis Keluhan",
                style: TypographyApp.queueDetTitle,
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  Container(
                    width: 75.w,
                    height: 29.h,
                    decoration: BoxDecoration(
                      color: ColorApp.primary.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Center(
                      child: Text(
                        "Pusing",
                        style: TypographyApp.queueDetIll,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w,),
                  Container(
                    width: 75.w,
                    height: 29.h,
                    decoration: BoxDecoration(
                      color: ColorApp.primary.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Center(
                      child: Text(
                        "Mual",
                        style: TypographyApp.queueDetIll,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.w,),
              Text(
                "Deskripsi Keluhan",
                style: TypographyApp.queueDetTitle,
              ),
              SizedBox(height: 12.h,),
              SizedBox(
                width: 323.w,
                child: Text(
                  loremIpsum,
                  style: TypographyApp.queueDesc,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 20.h,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        height: 98.h,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: HexColor('#929DAB').withOpacity(0.10),
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ]),
        child: ElevatedButton(
          child: Text(
            'Selesai Pemeriksaan',
            style: TypographyApp.queueOnBtn,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorApp.primary,
            padding: EdgeInsets.symmetric(horizontal: 87.w, vertical: 18.h),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
