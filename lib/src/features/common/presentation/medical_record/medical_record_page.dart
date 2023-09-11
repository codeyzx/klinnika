import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/common_widgets/async_value/async_value_widget.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/presentation.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class MedicalRecordPage extends ConsumerStatefulWidget {
  final String queueId;
  const MedicalRecordPage({
    super.key,
    required this.queueId,
  });

  @override
  ConsumerState<MedicalRecordPage> createState() => _MedicalRecordPageState();
}

class _MedicalRecordPageState extends ConsumerState<MedicalRecordPage> {
  MedicalRecordController get controller => ref.read(medicalRecordControllerProvider.notifier);
  MedicalRecordState get state => ref.watch(medicalRecordControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.getMedicalRecord(widget.queueId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Rekam Medis",
          style: TypographyApp.queueAppbarSmall,
        ),
        centerTitle: false,
      ),
      body: AsyncValueWidget(
        value: state.medicalValue,
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: state.medical!.isEmpty
                  ? Container(
                      margin: EdgeInsets.only(
                        top: context.screenHeightPercentage(0.4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Tidak ada rekam medis",
                        style: TypographyApp.queueMRTitle,
                      ),
                    )
                  : Accordion(
                      paddingBetweenOpenSections: 16.h,
                      paddingBetweenClosedSections: 16.h,
                      headerPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
                      headerBorderColor: HexColor('#929DAB'),
                      headerBorderColorOpened: HexColor('#929DAB'),
                      headerBackgroundColorOpened: Colors.white,
                      headerBackgroundColor: Colors.white,
                      contentBorderColor: HexColor('#929DAB'),
                      contentBorderWidth: 0.3.w,
                      contentHorizontalPadding: 20,
                      scaleWhenAnimating: true,
                      openAndCloseAnimation: true,
                      headerBorderRadius: 6.r,
                      rightIcon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: ColorApp.black,
                      ),
                      children: state.medical!
                          .map(
                            (e) => AccordionSection(
                              contentBorderColor: HexColor('#929DAB'),
                              contentBorderWidth: 0.3.w,
                              headerBorderWidth: 0.3,
                              headerBorderColor: HexColor('#929DAB'),
                              headerBorderColorOpened: HexColor('#929DAB'),
                              contentBorderRadius: 6.r,
                              header: Text(
                                "RM-${e.id}",
                                style: TypographyApp.queueMRTitle,
                              ),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Tanggal", style: TypographyApp.queueDetLabel),
                                      Text(
                                        e.createdAt!.dateMonthYear,
                                        style: TypographyApp.queueDetValue,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Oleh", style: TypographyApp.queueDetLabel),
                                      SizedBox(
                                        width: 0.5.sw,
                                        child: Text(
                                          'Dr. ${e.doctorName}',
                                          style: TypographyApp.queueDetValue,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Tindakan", style: TypographyApp.queueDetLabel),
                                      Text(
                                        // "Pemberian Obat",
                                        e.actType!,
                                        style: TypographyApp.queueDetValue,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Divider(
                                    height: 0.6,
                                    color: HexColor('#929DAB'),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    "Obat diberikan",
                                    style: TypographyApp.queueDetLabel,
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  e.medical!.medicals!.isNotEmpty
                                      ? Text(
                                          e.medical!.medicals!.join(', '),
                                          style: TypographyApp.queueDetValue,
                                        )
                                      : Text(
                                          "Tidak ada obat yang diberikan",
                                          style: TypographyApp.queueDetValue,
                                        ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    "Diagnosa",
                                    style: TypographyApp.queueDetLabel,
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    // "Gangguan pada saraf hidung serta mata yang juga merambat ke pembuluh darah. Kemungkinan besar disebab kan oleh stress yang berlebih serta makan makanan yang tidak sehat dan tak teratur",
                                    e.diagnose.toString(),
                                    style: TypographyApp.queueDetValue,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ),
          );
        },
      ),
    );
  }
}
