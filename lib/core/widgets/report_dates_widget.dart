import 'package:flutter/material.dart';

import 'custom_text_form_feild.dart';

class ReportDatesWidget extends StatelessWidget {
  final TextEditingController startDateController, endDateController;
  final Function(BuildContext, bool) pickDate;
  const ReportDatesWidget({super.key, required this.startDateController, required this.endDateController, required this.pickDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            readOnly: true,
            hintText: 'من تاريخ',
            suffixIcon: const Icon(Icons.calendar_month),
            onTap: () => pickDate(context, true),
            controller: startDateController,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomTextFormField(
            readOnly: true,
            hintText: 'الي تاريخ',
            suffixIcon: const Icon(Icons.calendar_month),
            onTap: () => pickDate(context, false),
            controller: endDateController,
          ),
        ),
      ],
    );
  }
}