import 'package:flutter/material.dart';

class SubFacilityOrderRowComponent extends StatelessWidget {
  final IconData icon;
  final String label;
  const SubFacilityOrderRowComponent({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.blue.shade600),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}