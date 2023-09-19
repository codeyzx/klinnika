import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/common_widgets/async_value/async_value_widget.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/common_controller.dart';
import 'package:klinnika/src/features/common/presentation/common_state.dart';
import 'package:klinnika/src/features/inventory/presentation/inventory_controller.dart';
import 'package:klinnika/src/features/inventory/presentation/inventory_state.dart';
import 'package:klinnika/src/routes/app_routes.dart';
import 'package:klinnika/src/routes/extras.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class InventoryPage extends ConsumerStatefulWidget {
  const InventoryPage({super.key});

  @override
  ConsumerState<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends ConsumerState<InventoryPage> {
  InventoryController get controller => ref.read(inventoryControllerProvider.notifier);
  InventoryState get state => ref.watch(inventoryControllerProvider);
  CommonState get userState => ref.watch(commonControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.getInventory(userState.user?.clinicId ?? '');
    });
    super.initState();
  }

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
                  'Jadwal hari ini: ${userState.user?.schedule?.startTime?.hourWithMinute} - ${userState.user?.schedule?.endTime?.hourWithMinute}',
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
                AsyncValueWidget(
                  value: state.inventoryStockValue,
                  data: (data) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        style: TypographyApp.invenSearchOn,
                        controller: controller.searchController,
                        onChanged: controller.searchData,
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
                      ListView.builder(
                        itemCount: state.searchData?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.pushNamed(
                                Routes.inventoryDetail.name,
                                extra: Extras(
                                  datas: {
                                    ExtrasKey.inventory: state.searchData?[index],
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
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
                                      Text(
                                        '${state.searchData?[index].inventory?.type.toString().capitalize}',
                                        style: TypographyApp.invenListType,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        '${state.searchData?[index].inventory?.name}',
                                        style: TypographyApp.invenListItem,
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Stok: ",
                                            style: TypographyApp.invenListLabel,
                                          ),
                                          Text(
                                            "${state.searchData?[index].amount}",
                                            style: TypographyApp.invenListValue,
                                          ),
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
                          );
                        },
                      ),
                    ],
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
