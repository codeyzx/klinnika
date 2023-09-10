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
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                TextFormField(
                  style: TypographyApp.invenSearchOn,
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari Sesuatu',
                    hintStyle: TypographyApp.invenSearchHint,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15.5.h, horizontal: 12.w),
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
                SizedBox(
                  height: 8.h,
                ),
                InkWell(
                  onTap: () {print("tapped");},
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 16.h),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.2.w, color: HexColor('#929DAB')),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Obat-obatan", style: TypographyApp.invenListType,),
                            SizedBox(height: 2.h,),
                            Text("Paracetamol 500mg", style: TypographyApp.invenListItem,),
                            SizedBox(height: 6.h,),
                            Row(
                              children: [
                                Text("Stok: ", style: TypographyApp.invenListLabel,),
                                Text("2", style: TypographyApp.invenListValue,),
                              ],
                            ),
                          ],
                        ),
                        Container(
                            width: 30.w,
                            height: 30.h,
                            margin: EdgeInsets.only(right: 10.w),
                            decoration: BoxDecoration(
                              color: ColorApp.primary.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: ColorApp.secondaryBlue,
                            ),
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
  }
}
