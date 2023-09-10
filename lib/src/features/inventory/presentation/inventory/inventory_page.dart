import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/history_detail/history_detail_page.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
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
                'Inventaris',
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

            ],
          ),
        ),
      ),
    );
  }
}
