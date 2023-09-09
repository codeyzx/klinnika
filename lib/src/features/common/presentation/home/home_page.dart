import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klinnika/src/common_widgets/common_widgets.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/common/presentation/checkup/checkup_controller.dart';
import 'package:klinnika/src/features/presentation.dart';
import 'package:klinnika/src/shared/extensions/extensions.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  HomeController get controller => ref.read(homeControllerProvider.notifier);
  HomeState get state => ref.watch(homeControllerProvider);
  CheckupController get queueController => ref.read(checkupControllerProvider.notifier);

  @override
  void initState() {
    safeRebuild(() {
      controller.fetchHome(
        '${state.user?.id}',
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        DateTime.now().add(const Duration(days: 1)),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queue = state.home?.queueList;
    return AsyncValueWidget(
      value: state.homeValue,
      data: (value) {
        return StatusBarWidget(
          child: Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Antrian Pasien',
                              style: TypographyApp.headline1,
                            ),
                            Text(
                              'Jadwal hari ini: 08.00 - 16.00',
                              style: TypographyApp.text1,
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.black.withOpacity(.2),
                            )
                          ],
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () async {
                              // filter date range

                              final result = await showDateRangePicker(
                                context: context,
                                firstDate: DateTime(DateTime.now().year - 1),
                                lastDate: DateTime(DateTime.now().year + 1),
                                initialDateRange: DateTimeRange(
                                  start: DateTime.now(),
                                  end: DateTime.now().add(
                                    const Duration(days: 7),
                                  ),
                                ),
                              );
                              if (result != null) {
                                controller.fetchHome(state.user!.id, result.start, result.end.toEndOfDay);
                              }
                            },
                            child: Container(
                              height: double.infinity,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black.withOpacity(.2)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        '${state.user?.name} - 21 Juli 2021',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: double.infinity,
                                    width: 50,
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  queueController.addQueue('${state.user?.id}');
                                  controller.fetchHome(
                                    '${state.user?.id}',
                                    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
                                    DateTime.now().add(const Duration(days: 1)),
                                  );
                                },
                                child: const Text('Add Data Queue')),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                onPressed: () {
                                  controller.fetchHome(
                                    '${state.user?.id}',
                                    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
                                    DateTime.now().add(const Duration(days: 1)),
                                  );
                                },
                                child: const Text('Refresh')),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: queue?.length ?? 0,
                          itemBuilder: (context, index) {
                            final item = queue?[index];

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item?.user?.name ?? '',
                                          style: TypographyApp.text1,
                                        ),
                                        Text(
                                          item?.complaintType ?? '',
                                          style: TypographyApp.text2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
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
