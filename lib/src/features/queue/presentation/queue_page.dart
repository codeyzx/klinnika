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
import 'package:klinnika/src/features/queue/presentation/queue_controller.dart';
import 'package:klinnika/src/features/queue/presentation/queue_state.dart';
import 'package:klinnika/src/routes/app_routes.dart';
import 'package:klinnika/src/routes/extras.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class QueuePage extends ConsumerStatefulWidget {
  const QueuePage({super.key});

  @override
  ConsumerState<QueuePage> createState() => _QueuePageState();
}

class _QueuePageState extends ConsumerState<QueuePage> {
  QueueController get controller => ref.read(queueControllerProvider.notifier);
  QueueState get state => ref.watch(queueControllerProvider);
  CheckupController get checkupController => ref.read(checkupControllerProvider.notifier);
  CheckupState get checkupState => ref.watch(checkupControllerProvider);
  CommonState get commonState => ref.watch(commonControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.fetchQueue(
        '${commonState.user?.id}',
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        DateTime.now().add(const Duration(days: 1)),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queue = state.queue;
    return AsyncValueWidget(
      value: state.queueValue,
      data: (value) {
        return StatusBarWidget(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60.h,
                            ),
                            Text(
                              'Antrian Pasien',
                              style: TypographyApp.queueBigTitle,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              'Jadwal hari ini: ${commonState.user?.schedule?.startTime.removeLast} - ${commonState.user?.schedule?.endTime.removeLast}',
                              style: TypographyApp.queueScheduleToday,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.black.withOpacity(.2),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ElevatedButton(
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
                          onPressed: () async {
                            final result = await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(DateTime.now().day - 1),
                              // firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 1),
                              initialDateRange: DateTimeRange(
                                start: DateTime(DateTime.now().day - 1),
                                // start: DateTime.now(),
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
                              controller.fetchQueue(commonState.user!.id, result.start, result.end.toEndOfDay);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 14.w,
                              ),
                              state.startDate ==
                                      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toString()
                                  ? Text(
                                      'Hari ini - ${DateTime.tryParse(state.endDate)?.dateMonthYear}',
                                      style: TypographyApp.queueScheduleSelect,
                                    )
                                  : Text(
                                      '${DateTime.tryParse(state.startDate)?.dateMonth} - ${DateTime.tryParse(state.endDate)?.dateMonthYear}',
                                      style: TypographyApp.queueScheduleSelect,
                                    ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
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
                        queue!.isEmpty
                            ? Center(
                                child: Text(
                                  'Tidak ada antrian',
                                  style: TypographyApp.queueScheduleSelect,
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: queue.length,
                                itemBuilder: (context, index) {
                                  final item = queue[index];
                                  return index == 0
                                      ? Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 120.w,
                                              height: 26.h,
                                              decoration: BoxDecoration(
                                                color: ColorApp.secondaryBlue,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(14.r),
                                                  topRight: Radius.circular(14.r),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Antrian Saat Ini",
                                                  style: TypographyApp.queueScheduleLabel,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 71.h,
                                              margin: EdgeInsets.only(bottom: 15.h),
                                              decoration: BoxDecoration(
                                                color: ColorApp.primary,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(4.r),
                                                  bottomRight: Radius.circular(4.r),
                                                  topRight: Radius.circular(4.r),
                                                ),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  context.pushNamed(
                                                    Routes.patientDetail.name,
                                                    extra: Extras(
                                                      datas: {
                                                        ExtrasKey.queue: item,
                                                        ExtrasKey.index: index + 1,
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        SizedBox(
                                                          width: 13.w,
                                                        ),
                                                        CircleAvatar(
                                                          radius: 25.r,
                                                          backgroundImage: const NetworkImage(
                                                              "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                                                        ),
                                                        SizedBox(
                                                          width: 13.w,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: 200.w,
                                                              child: Text(
                                                                '${item.patient?.name}',
                                                                style: TypographyApp.queueListNameOn,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                            Text(
                                                              "No. antrian: ${index + 1}",
                                                              style: TypographyApp.queueListNumOn,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: 36.w,
                                                      height: 36.h,
                                                      margin: EdgeInsets.only(right: 13.w),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
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
                                        )
                                      : Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(bottom: 15.h),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(width: 0.2.w, color: HexColor('#929DAB')),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  context.pushNamed(
                                                    Routes.patientDetail.name,
                                                    extra: Extras(
                                                      datas: {
                                                        ExtrasKey.queue: item,
                                                        ExtrasKey.index: index + 1,
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        CircleAvatar(
                                                          radius: 22.r,
                                                          backgroundImage: const NetworkImage(
                                                              "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                                                        ),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        Container(
                                                          height: 20.h,
                                                          width: 1.w,
                                                          color: HexColor('#929DAB'),
                                                        ),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              width: 200.w,
                                                              child: Text(
                                                                '${item.patient?.name}',
                                                                style: TypographyApp.queueListNameOff,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "No. antrian: ",
                                                                  style: TypographyApp.queueListNumOffLabel,
                                                                ),
                                                                Text(
                                                                  "${index + 1}",
                                                                  style: TypographyApp.queueListNumOffValue,
                                                                ),
                                                              ],
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
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                            ],
                                          ),
                                        );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
