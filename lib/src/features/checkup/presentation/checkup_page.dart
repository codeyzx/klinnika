import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/checkup/presentation/checkup_controller.dart';
import 'package:klinnika/src/features/checkup/presentation/checkup_state.dart';
import 'package:klinnika/src/features/common/presentation/common_controller.dart';
import 'package:klinnika/src/features/common/presentation/common_state.dart';
import 'package:klinnika/src/features/medical_record/domain/medicine.dart';
import 'package:klinnika/src/features/queue/domain/queue_convert.dart';
import 'package:klinnika/src/features/queue/presentation/queue_controller.dart';
import 'package:klinnika/src/routes/app_routes.dart';
import 'package:quickalert/quickalert.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class CheckupPage extends ConsumerStatefulWidget {
  final QueueConvert item;

  const CheckupPage({
    super.key,
    required this.item,
  });

  @override
  ConsumerState<CheckupPage> createState() => _CheckupPageState();
}

class _CheckupPageState extends ConsumerState<CheckupPage> {
  QueueController get queueController =>
      ref.read(queueControllerProvider.notifier);
  CheckupController get controller =>
      ref.read(checkupControllerProvider.notifier);
  CheckupState get state => ref.watch(checkupControllerProvider);
  CommonState get userState => ref.watch(commonControllerProvider);
  QueueConvert get item => widget.item;

  @override
  void initState() {
    safeRebuild(() {
      controller.getInventoryStock('${userState.user?.clinicId}');
    });
    super.initState();
  }

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
            context.pop();
          },
        ),
        title: Text(
          "Selesai Pemeriksaan",
          style: TypographyApp.queueAppbarSmall,
        ),
        centerTitle: false,
      ),
      body: AsyncValueWidget(
        value: state.inventoryStockValue,
        data: (data) => SingleChildScrollView(
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
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: HexColor('#929DAB'),
                        width: 0.5.w,
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: state.actType,
                        style: TypographyApp.text1,
                        isDense: true,
                        onChanged: controller.setActType,
                        items: actType.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TypographyApp.text1,
                            ),
                          );
                        }).toList()),
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
                        return Consumer(
                          builder: (context, ref, child) {
                            final controller =
                                ref.watch(checkupControllerProvider.notifier);
                            final state = ref.watch(checkupControllerProvider);
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
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Tambah Obat",
                                              style: TypographyApp.cdDrug,
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              icon: Icon(
                                                Icons.close_rounded,
                                                color: HexColor('#5F6C7B'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        TextFormField(
                                          style: TypographyApp.invenSearchOn,
                                          controller:
                                              controller.searchController,
                                          onChanged: controller.searchData,
                                          decoration: InputDecoration(
                                            hintText: 'Cari Sesuatu',
                                            hintStyle:
                                                TypographyApp.invenSearchHint,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 15.5.h,
                                                    horizontal: 12.w),
                                            prefixIcon: Icon(
                                              Icons.search_rounded,
                                              color: HexColor('#929DAB'),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                              borderSide: BorderSide(
                                                color: HexColor('#929DAB'),
                                                width: 0.5.w,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Gap.h12,
                                        state.searchValue is AsyncLoading
                                            ? const LoadingWidget()
                                            : Column(
                                                children: state.searchData!
                                                    .map(
                                                      (e) => Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: InkWell(
                                                          onTap: () {
                                                            final medicine =
                                                                Medicine(
                                                              name: e.inventory
                                                                  ?.name,
                                                              id: e.id,
                                                              expiredAt:
                                                                  e.expiredAt,
                                                              inventoryId:
                                                                  e.inventoryId,
                                                              amount: e.amount,
                                                              quantity: 1,
                                                            );
                                                            controller
                                                                .addMedicine(
                                                                    medicine);
                                                            context.pop();
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 18,
                                                              bottom: 12,
                                                              left: 12,
                                                              right: 12,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                bottom: BorderSide(
                                                                    width:
                                                                        0.2.w,
                                                                    color: HexColor(
                                                                        '#929DAB')),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      '${e.inventory?.name}',
                                                                      style: TypographyApp
                                                                          .cdDrugList,
                                                                    ),
                                                                    Text(
                                                                      'Stok: ${e.amount}',
                                                                      style: TypographyApp
                                                                          .cdDrugCount,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 3.h,
                                                                ),
                                                                Text(
                                                                    'Exp: ${e.expiredAt?.dateMonthYear}',
                                                                    style: TypographyApp
                                                                        .cdDrugExp),
                                                              ],
                                                            ),
                                                            // child: Row(
                                                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            //   children: [
                                                            //     Row(
                                                            //       children: [
                                                            //         Text(
                                                            //           '${e.inventory?.name}',
                                                            //           style: TypographyApp.cdDrug,
                                                            //         ),
                                                            //         //expire
                                                            //         Text(
                                                            //           ' (${e.expiredAt?.dateMonthYear})',
                                                            //           style: TypographyApp.cdDrug.copyWith(
                                                            //             fontSize: 8.sp,
                                                            //           ),
                                                            //         ),
                                                            //       ],
                                                            //     ),
                                                            //     Text(
                                                            //       '${e.amount}',
                                                            //       style: TypographyApp.cdDrugCount,
                                                            //     ),
                                                            //   ],
                                                            // ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
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
                      const Icon(
                        Icons.add_rounded,
                        color: ColorApp.blue,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: state.medicine?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 12.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
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
                                state.medicine![index].name!,
                                style: TypographyApp.cdDrug,
                              ),
                              Text(
                                "Sisa: ${state.medicine![index].amount}",
                                style: TypographyApp.cdDrugCount,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320.w,
                            child: TextFormField(
                              textAlign: TextAlign.justify,
                              style: TypographyApp.cdDrugDescValue,
                              controller: state.medicineController![index],
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
                                  onPressed: () {
                                    controller.removeMedicine(index);
                                  },
                                  icon: Icon(
                                    Icons.delete_outline_outlined,
                                    color: HexColor('#5F6C7B'),
                                  )),
                              SizedBox(
                                width: 32.w,
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.removeQty(index);
                                  },
                                  icon: Icon(
                                    Icons.remove_sharp,
                                    color: HexColor('#929DAB'),
                                  )),
                              SizedBox(
                                width: 13.w,
                              ),
                              Text(
                                "${state.medicine![index].quantity}",
                                style: TypographyApp.cdDrugItemCount,
                              ),
                              SizedBox(
                                width: 13.w,
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.addQty(index);
                                  },
                                  icon: Icon(
                                    Icons.add_sharp,
                                    color: HexColor('#3DA9FC'),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
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
                  controller: controller.diagnosaController,
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                  style: TypographyApp.cdDrugDescValue,
                  decoration: InputDecoration(
                      hintText: '...',
                      hintStyle: TypographyApp.cdDrugDescValue,
                      contentPadding: const EdgeInsets.all(12),
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
          onPressed: state.buttonValue is AsyncLoading
              ? null
              : () async {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    title: 'Konfirmasi Pemeriksaan?',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    titleColor: ColorApp.black,
                    confirmBtnColor: ColorApp.primary,
                    onConfirmBtnTap: () async {
                      controller.setMedicine();
                      final medicalId = await controller.addMedical();
                      if (medicalId != null) {
                        await controller.addMedicalRecord(
                            queue: item,
                            user: userState.user!,
                            medicalId: medicalId);
                        queueController.fetchQueue(
                          userState.user!.id,
                          DateTime(DateTime.now().year, DateTime.now().month,
                              DateTime.now().day),
                          DateTime.now().add(const Duration(days: 1)),
                        );
                        Future.delayed(const Duration(seconds: 1)).then((_) {
                          appSnackBar(context, Colors.green, 'Success');
                          Future.delayed(const Duration(seconds: 2)).then((_) {
                            context.goNamed(Routes.botNavBar.name);
                          });
                        });
                      }
                    },
                    onCancelBtnTap: () {
                      context.pop();
                    },
                  );
                },
          child: state.buttonValue is AsyncLoading
              ? Container(
                  alignment: Alignment.center,
                  child: const LoadingWidget(),
                )
              : Text(
                  'Konfirmasi & Selesai',
                  style: TypographyApp.queueOnBtn,
                ),
        ),
      ),
    );
  }
}
