import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record_convert.dart';
import 'package:klinnika/src/routes/app_routes.dart';
import 'package:klinnika/src/routes/extras.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({
    super.key,
    required this.item,
  });

  final MedicalRecordConvert item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: ElevatedButton(
        onPressed: () {
          context.pushNamed(
            Routes.historyDetail.name,
            extra: Extras(
              datas: {
                ExtrasKey.medicalRecord: item,
              },
            ),
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
                  backgroundImage: AssetImage('assets/images/sick_patient_img.jpg'),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        item.patient?.name ?? '',
                        style: TypographyApp.historyName,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'RM-${item.id}',
                      style: TypographyApp.historyMedRec,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Text(
                item.createdAt!.historyDate,
                style: TypographyApp.historyClock,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
