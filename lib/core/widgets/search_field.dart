import 'package:flutter/material.dart';
import '../utils/media_query_values.dart';

class SearchField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final Function() focusOn;
  final Function() unFocus;
  final bool fullWidth;
  final double? width;
  const SearchField({
    super.key, 
    required this.hint, 
    required this.controller, 
    required this.focusNode, 
    required this.onChanged, 
    required this.focusOn, 
    required this.unFocus, 
    required this.fullWidth,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? (fullWidth ? context.width : 290),
      height: 46,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(245, 245, 245, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onChanged: (val) => onChanged(val),
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => focusOn,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => unFocus,
          ),
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
}