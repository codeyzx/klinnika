import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';

class InventoryDetailPage extends StatefulWidget {
  const InventoryDetailPage({super.key});

  @override
  State<InventoryDetailPage> createState() => _InventoryDetailPageState();
}

class _InventoryDetailPageState extends State<InventoryDetailPage> {
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
          "Detail Inventaris",
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
              SizedBox(height: 24.h,),
              Text(
                'Paracetamol 500mg',
                style: TypographyApp.queueDetName,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "INV-20",
                style: TypographyApp.queueDetNum,
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
                "Informasi",
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
                    "Sisa Stok",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    "20",
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
                    "Jenis",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    "Obat-obatan",
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
                    "Jenis",
                    style: TypographyApp.queueDetLabel,
                  ),
                  Text(
                    "Tablet",
                    style: TypographyApp.queueDetValue,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Deskripsi",
                style: TypographyApp.queueDetTitle,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "obat analgesik dan antipiretik yang banyak dipakai untuk meredakan sakit kepala ringan akut, nyeri ringan hingga sedang, serta demam.",
                style: TypographyApp.queueDesc,
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
                "Riwayat Pembelian",
                style: TypographyApp.queueDetTitle,
              ),
              SizedBox(height: 16.h,),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 12.h),
                padding: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.2.w, color: HexColor('#929DAB')),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "ID",
                          style: TypographyApp.queueDetLabel,
                        ),
                        Text(
                          "PUR-20",
                          style: TypographyApp.queueDetValue,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Tanggal",
                          style: TypographyApp.queueDetLabel,
                        ),
                        Text(
                          "12 Agustus 2023",
                          style: TypographyApp.queueDetValue,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Jumlah",
                          style: TypographyApp.queueDetLabel,
                        ),
                        Text(
                          "150",
                          style: TypographyApp.queueDetValue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 12.h),
                padding: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.2.w, color: HexColor('#929DAB')),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "ID",
                          style: TypographyApp.queueDetLabel,
                        ),
                        Text(
                          "PUR-21",
                          style: TypographyApp.queueDetValue,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Tanggal",
                          style: TypographyApp.queueDetLabel,
                        ),
                        Text(
                          "17 Agustus 2023",
                          style: TypographyApp.queueDetValue,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Jumlah",
                          style: TypographyApp.queueDetLabel,
                        ),
                        Text(
                          "200",
                          style: TypographyApp.queueDetValue,
                        ),
                      ],
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
