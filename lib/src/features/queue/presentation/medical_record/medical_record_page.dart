import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:accordion/accordion.dart';

class MedicalRecordPage extends StatefulWidget {
  const MedicalRecordPage({super.key});

  @override
  State<MedicalRecordPage> createState() => _MedicalRecordPageState();
}

class _MedicalRecordPageState extends State<MedicalRecordPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Accordion(
            paddingBetweenOpenSections: 16.h,
            paddingBetweenClosedSections: 16.h,

            headerPadding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
            headerBorderColor: HexColor('#929DAB'),
            headerBorderColorOpened:HexColor('#929DAB'),
            headerBackgroundColorOpened: Colors.white,
            headerBackgroundColor: Colors.white,
            contentBorderColor: HexColor('#929DAB'),
            contentBorderWidth: 0.3.w,
            contentHorizontalPadding: 20,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerBorderRadius: 6.r,
            rightIcon: Icon(Icons.keyboard_arrow_down_rounded, color: ColorApp.black,),
            children: [
              AccordionSection(
                contentBorderColor: HexColor('#929DAB'),
                contentBorderWidth: 0.3.w,
                headerBorderWidth: 0.3,
                headerBorderColor: HexColor('#929DAB'),
                headerBorderColorOpened: HexColor('#929DAB'),
                contentBorderRadius: 6.r,
                header: Text("RM-23", style: TypographyApp.queueMRTitle,),
                content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tanggal",  style: TypographyApp.queueDetLabel),
                          Text("20 Jul 2023", style: TypographyApp.queueDetValue,)
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Oleh",  style: TypographyApp.queueDetLabel),
                          Text("Dr. manhattan", style: TypographyApp.queueDetValue,)
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tindakan",  style: TypographyApp.queueDetLabel),
                          Text("Pemberian Obat", style: TypographyApp.queueDetValue,)
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Divider(
                        height: 0.6,
                        color: HexColor('#929DAB'),
                      ),
                      SizedBox(height: 12.h,),
                      Text("Obat diberikan", style: TypographyApp.queueDetLabel,),
                      SizedBox(height: 12.h,),
                      Text("Paracetamol tablet 500 mg, Obat pilek flu batuk kanker", style: TypographyApp.queueDetValue,),
                      SizedBox(height: 12.h,),
                      Text("Diagnosa", style: TypographyApp.queueDetLabel,),
                      SizedBox(height: 12.h,),
                      Text("Gangguan pada saraf hidung serta mata yang juga merambat ke pembuluh darah. Kemungkinan besar disebab kan oleh stress yang berlebih serta makan makanan yang tidak sehat dan tak teratur", style: TypographyApp.queueDetValue, textAlign: TextAlign.justify,),
                    ],
                  ),
                ),
              AccordionSection(
                contentBorderColor: HexColor('#929DAB'),
                contentBorderWidth: 0.3.w,
                headerBorderWidth: 0.3,
                headerBorderColor: HexColor('#929DAB'),
                headerBorderColorOpened: HexColor('#929DAB'),
                contentBorderRadius: 6.r,
                header: Text("RM-22", style: TypographyApp.queueMRTitle,),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tanggal",  style: TypographyApp.queueDetLabel),
                        Text("21 Jul 2023", style: TypographyApp.queueDetValue,)
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Oleh",  style: TypographyApp.queueDetLabel),
                        Text("Dr. Strange", style: TypographyApp.queueDetValue,)
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tindakan",  style: TypographyApp.queueDetLabel),
                        Text("Suntik Mati", style: TypographyApp.queueDetValue,)
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Divider(
                      height: 0.6,
                      color: HexColor('#929DAB'),
                    ),
                    SizedBox(height: 12.h,),
                    Text("Obat diberikan", style: TypographyApp.queueDetLabel,),
                    SizedBox(height: 12.h,),
                    Text("Paracetamol tablet 500 mg, Obat pilek flu batuk kanker", style: TypographyApp.queueDetValue,),
                    SizedBox(height: 12.h,),
                    Text("Diagnosa", style: TypographyApp.queueDetLabel,),
                    SizedBox(height: 12.h,),
                    Text("Gangguan pada saraf hidung serta mata yang juga merambat ke pembuluh darah. Kemungkinan besar disebab kan oleh stress yang berlebih serta makan makanan yang tidak sehat dan tak teratur", style: TypographyApp.queueDetValue, textAlign: TextAlign.justify,),
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
