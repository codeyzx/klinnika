import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({super.key});

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
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
                    backgroundImage: const NetworkImage(
                        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ahmad Joni',
                        style: TypographyApp.queueDetName,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "RM-28",
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
                    "16 Mei 2004",
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
                    "Dr. Tirta",
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
                    "Pemberian Obat",
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
              SizedBox(
                height: 16.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Paracetamol 500mg",
                    style: TypographyApp.historyDetBigLabel,
                  ),
                  Text(
                    "Jumlah: 2",
                    style: TypographyApp.historyDetBigValue,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Spesial tanggal cantik 9 September ini, kamu bisa borong beragam produk menarik yang banting harga mulai jam 14:00 WIB",
                style: TypographyApp.historyDetDesc,
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Obat Batuk Berdahak",
                    style: TypographyApp.historyDetBigLabel,
                  ),
                  Text(
                    "Jumlah: 2",
                    style: TypographyApp.historyDetBigValue,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "-",
                style: TypographyApp.historyDetDesc,
                textAlign: TextAlign.justify,
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
              Text(
                "Terjadi pembengkakan pada pembuluh mata sebelah kanan, dimana pasien sendiri mengatakan diakibatkan oleh kecelakaan saat berkerja. Tidak ada luka daram yang fatal.",
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
