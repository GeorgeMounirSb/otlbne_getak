import 'package:flutter/material.dart';

class BasicFilterComponent extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback selectFilter;
  const BasicFilterComponent({super.key, required this.title, required this.isSelected, required this.selectFilter});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectFilter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? Colors.blueAccent : Colors.grey, width: .5),
        ),
        child: Text(title, style: TextStyle(color: isSelected ? Colors.blueAccent : Colors.grey, fontWeight: FontWeight.w400)),
      ),
    );
  }
}