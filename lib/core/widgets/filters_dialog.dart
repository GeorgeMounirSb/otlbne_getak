// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  double ratingRange;
  final Function(double) applyFilters;
  final Function() clearFilters;
  FilterDialog({super.key, this.ratingRange = 3.0, required this.applyFilters, required this.clearFilters});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late double ratingRange;

  @override
  void initState() {
    super.initState();
    ratingRange = widget.ratingRange;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter Doctors'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Rating: ${ratingRange.toStringAsFixed(1)} and above'),
            Slider(
              min: 1,
              max: 5,
              divisions: 8,
              value: ratingRange,
              label: ratingRange.toString(),
              onChanged: (value) {
                ratingRange = value;
                setState(() {});
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Clear Filters'),
          onPressed: () {
            widget.clearFilters();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text('Apply'),
          onPressed: () {
            widget.applyFilters(ratingRange);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
