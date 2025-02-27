import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../theming/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final double? width;
  final Widget? child;
  final Color? backgroundColor;

  const PrimaryButton({super.key, required this.text, this.onTap, this.width, this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        width: width ?? 311,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor ?? HexColor('#34B1DD'),
        ),
        child: Center(
          child: child ?? Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: ColorsManager.white),
          ),
        ),
      ),
    );
  }
}
