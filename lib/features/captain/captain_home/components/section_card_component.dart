import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class SectionCardComponent extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget screen;
  const SectionCardComponent({super.key, required this.title, required this.icon, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsManager.textFormFillColor,
      borderRadius: BorderRadius.circular(16),
      elevation: 6,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: ColorsManager.dark),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: ColorsManager.dark)),
          ],
        ),
      ),
    );
  }
}