import 'package:flutter/material.dart';

class HospitalDateComponent extends StatelessWidget {
  final String title, value;
  final VoidCallback selectDate;
  const HospitalDateComponent({super.key, required this.title, required this.value, required this.selectDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
          InkWell(
            onTap: selectDate,
            child: Container(
              alignment: Alignment.center,
              height: 35,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(value,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400,),textDirection: TextDirection.rtl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}