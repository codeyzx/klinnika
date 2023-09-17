import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:klinnika/src/common_widgets/async_value/async_value_widget.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/common_controller.dart';
import 'package:klinnika/src/features/common/presentation/common_state.dart';
import 'package:klinnika/src/features/history/presentation/widget/history_card_widget.dart';
import 'package:klinnika/src/features/medical_record/presentation/medical_record_controller.dart';
import 'package:klinnika/src/features/medical_record/presentation/medical_record_state.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  MedicalRecordController get controller => ref.read(medicalRecordControllerProvider.notifier);
  MedicalRecordState get state => ref.watch(medicalRecordControllerProvider);
  CommonState get userState => ref.watch(commonControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.getListMedicalRecord(userState.user?.id ?? '', null, null);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncValueWidget(
      value: state.medicalValue,
      data: (data) {
        return Scaffold(
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
                    'Riwayat Pemeriksaan',
                    style: TypographyApp.queueBigTitle,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    'Jadwal hari ini: ${userState.user?.schedule?.startTime.removeLast} - ${userState.user?.schedule?.endTime.removeLast}',
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
                  ElevatedButton(
                    onPressed: () async {
                      final result = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 1),
                        initialDateRange: DateTimeRange(
                          start: DateTime.now(),
                          end: DateTime.now().add(
                            const Duration(days: 1),
                          ),
                        ),
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light(
                                primary: ColorApp.primary,
                                onPrimary: ColorApp.white,
                                surface: ColorApp.white,
                                onSurface: ColorApp.black,
                              ),
                              dialogBackgroundColor: ColorApp.white,
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor: ColorApp.primary,
                                ),
                              ),
                              buttonTheme: const ButtonThemeData(
                                textTheme: ButtonTextTheme.primary,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (result != null) {
                        controller.getListMedicalRecord(userState.user?.id ?? '', result.start, result.end.toEndOfDay);
                      }
                    },
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
                        state.startDate == '' && state.endDate == ''
                            ? Text(
                                'Semua Tanggal',
                                style: TypographyApp.queueScheduleSelect,
                              )
                            : Text(
                                '${DateTime.tryParse(state.startDate.toString())?.dateMonth} - ${DateTime.tryParse(state.endDate.toString())?.dateMonthYear}',
                                style: TypographyApp.queueScheduleSelect,
                              ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
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
                  state.medical!.isEmpty
                      ? Container(
                          margin: EdgeInsets.only(top: 20.h),
                          child: Center(
                            child: Text(
                              'Tidak ada riwayat pemeriksaan',
                              style: TypographyApp.queueScheduleSelect,
                            ),
                          ),
                        )
                      : ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            if (state.todayItems.isNotEmpty) HistoryCardWidget(item: state.todayItems, date: 'Hari ini'),
                            if (state.yesterdayItems.isNotEmpty)
                              HistoryCardWidget(item: state.yesterdayItems, date: 'Kemarin'),
                            if (state.expiredItems.isNotEmpty) HistoryCardWidget(item: state.expiredItems, date: 'Lawas'),
                          ],
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
