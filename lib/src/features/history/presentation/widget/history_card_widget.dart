import 'package:flutter/material.dart';
import 'package:klinnika/src/constants/constants.dart';
import 'package:klinnika/src/features/history/presentation/widget/history_item_widget.dart';
import 'package:klinnika/src/features/medical_record/domain/medical_record_convert.dart';

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    super.key,
    required this.item,
    required this.date,
  });

  final List<MedicalRecordConvert> item;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: TypographyApp.historyDay,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: item.length,
          itemBuilder: (context, index) {
            final item = this.item[index];
            return HistoryItemWidget(item: item);
          },
        ),
        Gap.h24,
      ],
    );
  }
}
