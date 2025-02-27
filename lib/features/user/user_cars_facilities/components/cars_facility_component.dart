import 'package:flutter/material.dart';

import '../model/cars_facility_model.dart';

class CarsFacilityComponent extends StatelessWidget {
  final CarsFacilityModel fac;
  final Widget navigateTo;
  const CarsFacilityComponent({super.key, required this.fac, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => navigateTo)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 111,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.asset(fac.img, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fac.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(width: 12),
                Row(
                  children: [
                    Text(fac.reviews, style: TextStyle(color: Colors.grey[700])),
                    const SizedBox(width: 12),
                    Text(fac.rate, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Icon(Icons.star, color: Colors.amber),
                  ],
                ),
                const SizedBox(width: 8),
                Row(
                  children: [
                    const Icon(Icons.timer, size: 18),
                    Text(fac.time),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}