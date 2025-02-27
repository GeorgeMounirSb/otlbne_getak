import 'package:flutter/material.dart';

import '../model/sub_facility_financial_model.dart';

class SubFacilityFinancialComponent extends StatelessWidget {
  final MaterialColor color;
  final IconData icon;
  final SubFacilityFinancialModel item;
  const SubFacilityFinancialComponent({super.key, required this.color, required this.icon, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.shade50,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.shade400, width: 1),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: color.shade400,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text("رقم الطلب: ${item.id}", style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("اسم العميل: ${item.client}", style: TextStyle(color: Colors.grey.shade700)),
            Text("تاريخ الطلب: ${item.date}", style: TextStyle(color: Colors.grey.shade700)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("المجموع", style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
            Text("${item.total} EGP", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}