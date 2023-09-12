import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
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
          "Jadwal Anda",
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
              SizedBox(height: 16.h,),
              Text("Senin", style: TypographyApp.scheduleDay,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.2.w,
                      color: HexColor('#929DAB'),
                    ),
                  ),
                ),
                child: Text("Jam 07:00 - 12:00", style: TypographyApp.scheduleClock,),
              ),
              SizedBox(height: 16.h,),
              Text("Selasa", style: TypographyApp.scheduleDay,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.2.w,
                      color: HexColor('#929DAB'),
                    ),
                  ),
                ),
                child: Text("Jam 07:00 - 12:00", style: TypographyApp.scheduleClock,),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.2.w,
                      color: HexColor('#929DAB'),
                    ),
                  ),
                ),
                child: Text("Jam 15:00 - 18:00", style: TypographyApp.scheduleClock,),
              ),
              SizedBox(height: 16.h,),
              Text("Rabu", style: TypographyApp.scheduleDay,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.2.w,
                      color: HexColor('#929DAB'),
                    ),
                  ),
                ),
                child: Text("-", style: TypographyApp.scheduleClock,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
