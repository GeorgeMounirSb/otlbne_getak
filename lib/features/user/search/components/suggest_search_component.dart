import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class SuggestSearchComponent extends StatelessWidget {
  final String suggest;
  final VoidCallback onTap;
  final bool? isSelected;
  const SuggestSearchComponent({super.key, required this.suggest, required this.onTap, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected == true ? ColorsManager.primaryColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(suggest, style: TextStyle(color: isSelected == true ? Colors.white : ColorsManager.dark)),
      ),
    );
  }
}