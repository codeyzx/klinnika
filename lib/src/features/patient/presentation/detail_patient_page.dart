import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/queue/domain/queue_convert.dart';
import 'package:klinnika/src/routes/routes.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class DetailPatientPage extends ConsumerWidget {
  final QueueConvert item;
  final int index;
  const DetailPatientPage({
    required this.item,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorApp.secondaryBlue,
          ),
          onPressed: () {
            context.pop();
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
                    backgroundImage: AssetImage('assets/images/sick_patient_img.jpg'),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${item.patient?.name}',
                        style: TypographyApp.queueDetName,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "Antrian nomor $index",
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
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(344.w, 50.h),
                  side: BorderSide(
                    color: ColorApp.primary,
                    width: 0.5.w,
                  ),
                  shadowColor: ColorApp.black.withOpacity(0.20),
                  backgroundColor: ColorApp.white,
                  padding: EdgeInsets.symmetric(horizontal: 87.w, vertical: 12.h),
                ),
                onPressed: () {
                  context.pushNamed(
                    Routes.medicalRecord.name,
                    extra: Extras(
                      datas: {
                        ExtrasKey.id: item.id,
                      },
                    ),
                  );
                },
                child: Text(
                  'Cek Rekam Medis',
                  style: TypographyApp.queueOnWhiteBtn,
                ),
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
                    "${item.patient?.name}",
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
                  Row(
                    children: [
                      Text(
                        '${item.patient?.birthDate!.dateMonthYear}',
                        style: TypographyApp.queueDetValue,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '(${item.patient?.birthDate!.age} thn)',
                        style: TypographyApp.queueDetValueBirth,
                      ),
                    ],
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
                    '${item.patient?.gender}',
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
                    item.patient?.email! == '' ? '-' : item.patient!.email!,
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
                    item.patient?.phone! == '' ? '-' : item.patient!.phone!,
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
                children: item.complaintType!.map((complaintType) {
                  return item.complaintType!.length == 1
                      ? Container(
                          height: 29.h,
                          margin: EdgeInsets.only(right: 12.w),
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            color: ColorApp.primary.withOpacity(0.10),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                complaintType,
                                style: TypographyApp.queueDetIll,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: Container(
                            height: 29.h,
                            margin: EdgeInsets.only(right: 12.w),
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              color: ColorApp.primary.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  complaintType,
                                  style: TypographyApp.queueDetIll,
                                ),
                              ),
                            ),
                          ),
                        );
                }).toList(),
              ),
              SizedBox(
                height: 24.w,
              ),
              Text(
                "Deskripsi Keluhan",
                style: TypographyApp.queueDetTitle,
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                width: 323.w,
                child: Text(
                  '${item.complaintDesc}',
                  style: TypographyApp.queueDesc,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        height: 98.h,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: HexColor('#929DAB').withOpacity(0.10),
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorApp.primary,
            padding: EdgeInsets.symmetric(horizontal: 87.w, vertical: 18.h),
          ),
          onPressed: () {
            context.pushNamed(
              Routes.checkup.name,
              extra: Extras(
                datas: {
                  ExtrasKey.queue: item,
                },
              ),
            );
          },
          child: Text(
            'Selesai Pemeriksaan',
            style: TypographyApp.queueOnBtn,
          ),
        ),
      ),
    );
  }
}
