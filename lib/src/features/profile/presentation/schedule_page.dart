import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/auth/domain/schedule.dart';
import 'package:klinnika/src/shared/extensions/date_time.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key, required this.schedule});

  final List<Schedule> schedule;

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
            children: schedule.map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.h24,
                  Text(
                    e.days ?? '',
                    style: TypographyApp.scheduleDay,
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
                    child: Text(
                      "${e.startTime?.hourWithMinute} - ${e.endTime?.hourWithMinute}",
                      style: TypographyApp.scheduleClock,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
