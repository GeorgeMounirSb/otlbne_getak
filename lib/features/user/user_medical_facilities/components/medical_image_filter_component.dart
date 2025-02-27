import 'package:flutter/material.dart';

class MedicalImageFilterComponent extends StatelessWidget {
  final VoidCallback selectFilter;
  final bool isSelected;
  final String img, title;
  const MedicalImageFilterComponent({super.key, required this.selectFilter, required this.isSelected, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectFilter,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: Colors.blueAccent, width: 1.5) : null,
        ),
        child: Column(
          children: [
            Image.asset(img),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(color: isSelected ? Colors.blue : Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}