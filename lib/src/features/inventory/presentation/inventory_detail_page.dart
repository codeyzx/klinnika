import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/common_widgets/async_value/async_value_widget.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/history/domain/inventory_stock_convert.dart';
import 'package:klinnika/src/features/inventory/presentation/inventory_controller.dart';
import 'package:klinnika/src/features/inventory/presentation/inventory_state.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class InventoryDetailPage extends ConsumerStatefulWidget {
  final InventoryStockConvert item;
  const InventoryDetailPage({super.key, required this.item});

  @override
  ConsumerState<InventoryDetailPage> createState() => _InventoryDetailPageState();
}

class _InventoryDetailPageState extends ConsumerState<InventoryDetailPage> {
  InventoryController get controller => ref.read(inventoryControllerProvider.notifier);
  InventoryState get state => ref.watch(inventoryControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.getListInventory(widget.item.inventoryId.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
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
      body: AsyncValueWidget(
        value: state.inventoryListValue,
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    item.inventory?.name.toString() ?? "",
                    style: TypographyApp.queueDetName,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    item.id.toString(),
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
                        item.amount.toString(),
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
                        item.inventory?.type.toString().capitalize ?? "",
                        style: TypographyApp.queueDetValue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Bentuk",
                        style: TypographyApp.queueDetLabel,
                      ),
                      Text(
                        item.inventory?.unitType.toString().capitalize ?? "",
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
                    item.inventory?.desc == "" ? "Tidak ada deskripsi" : item.inventory?.desc ?? "Tidak ada deskrips",
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
                  SizedBox(
                    height: 16.h,
                  ),
                  AsyncValueWidget(
                    value: state.inventoryListValue,
                    data: (data) {
                      return ListView.builder(
                        itemCount: data?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = data![index];
                          return Container(
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
                                      item.id.toString(),
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
                                      "Tanggal",
                                      style: TypographyApp.queueDetLabel,
                                    ),
                                    Text(
                                      item.createdAt?.dateMonthYear ?? "",
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
                                      "Jumlah",
                                      style: TypographyApp.queueDetLabel,
                                    ),
                                    Text(
                                      item.amount.toString(),
                                      style: TypographyApp.queueDetValue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
