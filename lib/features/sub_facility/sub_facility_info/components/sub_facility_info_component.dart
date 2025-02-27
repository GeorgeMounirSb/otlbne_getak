import 'package:flutter/material.dart';
import 'package:otlbne_getak/core/theming/colors.dart';

class SubFacilityInfoComponent extends StatelessWidget {
  final String title;
  final Widget navigateTo;
  const SubFacilityInfoComponent({super.key, required this.title, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => navigateTo)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorsManager.dark)),
            Icon(Icons.arrow_forward_ios, color: ColorsManager.dark, size: 22),
          ],
        ),
      ),
    );
  }
}