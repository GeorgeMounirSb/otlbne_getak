import 'package:flutter/material.dart';

import '../theming/colors.dart';

class CustomDropdownButtonField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder, enabledBorder;
  final TextStyle? inputTextStyle, hintStyle;
  final String hintText;
  final Color? fillColor;
  final List<String> items;
  final String? value;
  final Function(String?)? onChanged;
  final Widget? prefixIcon;

  const CustomDropdownButtonField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.fillColor,
    required this.items,
    this.value,
    this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          focusedBorder: focusedBorder ?? OutlineInputBorder(
            borderSide: BorderSide(color: ColorsManager.dark, width: 0),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: enabledBorder ?? OutlineInputBorder(
            borderSide: const BorderSide(color: ColorsManager.textFormBorderColor, width: 0),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: inputTextStyle ?? TextStyle(color: ColorsManager.dark),
            ),
          );
        }).toList(),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
        style: inputTextStyle ?? TextStyle(color: ColorsManager.dark),
        dropdownColor: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}