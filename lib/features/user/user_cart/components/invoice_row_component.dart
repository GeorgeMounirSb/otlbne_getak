import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class InvoiceRowComponent extends StatelessWidget {
  final String title, price;
  const InvoiceRowComponent({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(price, style: TextStyle(fontSize: 16, color: HexColor('#154758'), fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}