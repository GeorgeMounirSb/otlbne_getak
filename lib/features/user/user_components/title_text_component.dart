import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TitleTextComponent extends StatelessWidget {
  final String title;
  final AlignmentGeometry? alignment;
  const TitleTextComponent({super.key, required this.title, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: Text(
        title, 
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 18, 
          color: HexColor('#1F6A85'),
        ),
      ),
    );
  }
}