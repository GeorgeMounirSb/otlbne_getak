import 'package:flutter/material.dart';

import '../../../core/theming/colors.dart';

class OrderProgressLineComponent extends StatelessWidget {
  final int currentStep;

  const OrderProgressLineComponent({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProgressStepCircle(icon: Icons.shopping_cart, label: 'تم الطلب', isActive: currentStep >= 0),
        ProgressStepLine(isActive: currentStep >= 0, distance: '500 م'),
        ProgressStepCircle(icon: Icons.restaurant, label: 'المطعم', isActive: currentStep >= 1),
        ProgressStepLine(isActive: currentStep >= 1, distance: '1.100 كم'),
        ProgressStepCircle(icon: Icons.delivery_dining, label: 'العميل', isActive: currentStep >= 2),
      ],
    );
  }
}

class ProgressStepCircle extends StatelessWidget {
  final bool showTitle;
  final bool isActive;
  final IconData icon;
  final String? label;
  const ProgressStepCircle({super.key, this.showTitle = true, required this.isActive, required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: isActive ? ColorsManager.primaryColor : Colors.grey[300],
          child: Icon(icon, size: 18, color: isActive ? Colors.white : Colors.grey[600]),
        ),
        const SizedBox(height: 4),
        if(showTitle == true) Text(label ?? '', style: TextStyle(fontSize: 12, color: isActive ? ColorsManager.primaryColor : Colors.grey)),
      ],
    );
  }
}

class ProgressStepLine extends StatelessWidget {
  final bool isActive;
  final String distance;
  const ProgressStepLine({super.key, required this.isActive, required this.distance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 4,
            color: isActive ? ColorsManager.primaryColor : Colors.grey[300],
          ),
          Text(distance, style: TextStyle(color: ColorsManager.dark, fontSize: 14)),
        ],
      ),
    );
  }
}