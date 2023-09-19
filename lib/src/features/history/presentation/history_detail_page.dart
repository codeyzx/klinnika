import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record_convert.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({
    super.key,
    required this.item,
  });

  final MedicalRecordConvert item;

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
          "Detail Pemeriksaan",
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
                        item.patient?.name ?? '',
                        style: TypographyApp.queueDetName,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        'RM-${item.id}',
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
                height: 0.6.h,
                color: HexColor('#929DAB'),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Data Pemeriksaan",
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
                    "Tanggal",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    item.createdAt?.dateMonthYear ?? '',
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
                    "Oleh",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    "Dr. ${item.doctorName ?? ''}",
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
                    "Tindakan",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    item.actType ?? '',
                    style: TypographyApp.queueDetValue,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                width: 120.w,
                height: 0.6.w,
                color: HexColor('#929DAB'),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Obat Diberikan",
                style: TypographyApp.queueDetTitle,
              ),
              Gap.h12,
              item.medical!.medicals!.isEmpty
                  ? Text(
                      'Tidak ada obat yang diberikan',
                      style: TypographyApp.historyDetDesc.copyWith(
                        fontSize: 14.sp,
                      ),
                    )
                  : Column(
                      children: item.medical!.medicals!
                          .map(
                            (medicine) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      medicine.name ?? '',
                                      style: TypographyApp.historyDetBigLabel,
                                    ),
                                    Text(
                                      medicine.quantity.toString(),
                                      style: TypographyApp.historyDetBigValue,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  medicine.desc.toString() == '' ? 'Tidak ada deskripsi' : medicine.desc.toString(),
                                  style: TypographyApp.historyDetDesc,
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                width: 120.w,
                height: 0.6.w,
                color: HexColor('#929DAB'),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Diagnosa",
                style: TypographyApp.queueDetTitle,
              ),
              Gap.h12,
              Text(
                item.diagnose.toString() == '' ? 'Tidak ada deskripsi' : item.diagnose.toString(),
                style: TypographyApp.queueDesc,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
