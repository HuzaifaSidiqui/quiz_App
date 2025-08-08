import 'package:flutter/material.dart';
import 'package:quiz_app/summary_item.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.summaryDataList, {super.key});

  final List<Map<String, Object>> summaryDataList;

  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryDataList.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
