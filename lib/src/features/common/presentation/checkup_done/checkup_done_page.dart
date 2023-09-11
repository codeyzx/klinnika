import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/constants/constants.dart';

class CheckupDonePage extends StatefulWidget {
  const CheckupDonePage({super.key});

  @override
  State<CheckupDonePage> createState() => _CheckupDonePageState();
}

class _CheckupDonePageState extends State<CheckupDonePage> {
  TextEditingController searchController = TextEditingController();

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
          "Selesai Pemeriksaan",
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
              Text(
                "Tindakan",
                style: TypographyApp.cdLabel,
              ),
              SizedBox(
                height: 8.h,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(344.w, 55.h),
                  side: BorderSide(
                    color: HexColor('#929DAB'),
                    width: 0.5.w,
                  ),
                  shadowColor: ColorApp.black.withOpacity(0.20),
                  backgroundColor: ColorApp.white,
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 14.w,
                    ),
                    Text(
                      "Pemberian Obat",
                      style: TypographyApp.queueScheduleSelect,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: HexColor('#5F6C7B'),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Obat",
                style: TypographyApp.cdLabel,
              ),
              SizedBox(
                height: 8.h,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            width: 310.w,
                            height: 370.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: Colors.white,
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Tambah Obat", style: TypographyApp.cdDrug,),
                                        IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.close_rounded, color: HexColor('#5F6C7B'),))
                                      ],
                                    ),
                                    SizedBox(height: 12.h,),
                                    TextFormField(
                                      style: TypographyApp.invenSearchOn,
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        hintText: 'Cari Sesuatu',
                                        hintStyle: TypographyApp.invenSearchHint,
                                        contentPadding: EdgeInsets.symmetric(vertical: 15.5.h, horizontal: 12.w),
                                        prefixIcon: Icon(
                                          Icons.search_rounded,
                                          color: HexColor('#929DAB'),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6.r),
                                          borderSide: BorderSide(
                                            color: HexColor('#929DAB'),
                                            width: 0.5.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){},
                                      child: Container(
                                        margin: EdgeInsets.only(top: 12.h),
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(width: 0.2.w, color: HexColor('#929DAB')),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Paracetamol 500mg",
                                              style: TypographyApp.cdDrug,
                                            ),
                                            Text(
                                              "Sisa: 20",
                                              style: TypographyApp.cdDrugCount,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(344.w, 55.h),
                  side: BorderSide(
                    color: ColorApp.blue,
                    width: 0.5.w,
                  ),
                  shadowColor: ColorApp.black.withOpacity(0.20),
                  backgroundColor: ColorApp.white,
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tambah Obat",
                      style: TypographyApp.cdAddBtn,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Icon(
                      Icons.add_rounded,
                      color: ColorApp.blue,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 12.h),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    width: 0.5.w,
                    color: HexColor('#929DAB'),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Paracetamol 500mg",
                          style: TypographyApp.cdDrug,
                        ),
                        Text(
                          "Sisa: 20",
                          style: TypographyApp.cdDrugCount,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 320.w,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        textAlign: TextAlign.justify,
                        style: TypographyApp.cdDrugDescValue,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tulis Catatan',
                          hintStyle: TypographyApp.cdDrugHint,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: HexColor('#5F6C7B'),
                            )),
                        SizedBox(
                          width: 32.w,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_sharp,
                              color: HexColor('#929DAB'),
                            )),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text(
                          "1",
                          style: TypographyApp.cdDrugItemCount,
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_sharp,
                              color: HexColor('#3DA9FC'),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Diagnosa",
                style: TypographyApp.cdLabel,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                textAlign: TextAlign.justify,
                style: TypographyApp.cdDrugDescValue,
                decoration: InputDecoration(
                    hintText: '...',
                    hintStyle: TypographyApp.cdDrugDescValue,
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        width: 0.6.w,
                        color: HexColor('#929DAB'),
                      ),
                    )),
              ),
              SizedBox(
                height: 110.h,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
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
          onPressed: () {},
          child: Text(
            'Konfirmasi & Selesai',
            style: TypographyApp.queueOnBtn,
          ),
        ),
      ),
    );
  }
}
