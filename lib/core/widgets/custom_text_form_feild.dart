import '../theming/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder, enabledBorder;
  final TextStyle? inputTextStyle, hintStyle;
  final bool? isObscureText, readOnly;
  final Widget? suffixIcon, preffixIcon;
  final String hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key, 
    this.keyboardType, 
    this.contentPadding, 
    this.onChanged, 
    this.onTap, 
    this.preffixIcon, 
    this.focusedBorder, 
    this.enabledBorder, 
    this.inputTextStyle, 
    this.hintStyle, 
    this.isObscureText, 
    this.suffixIcon, 
    required this.hintText, 
    this.fillColor, 
    this.controller, 
    this.readOnly, 
    this.maxLines,
    this.focusNode,
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
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        focusNode: focusNode,
        readOnly: readOnly == null ? false : readOnly!,
        maxLines: maxLines,
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
          prefixIcon: preffixIcon,
          suffixIcon: suffixIcon,
        ),
        obscureText: isObscureText ?? false,
      ),
    );
  }
}