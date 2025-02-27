import 'package:flutter/material.dart';

import '../../../core/theming/colors.dart';
import 'order_progress_line_component.dart';

class CaptainOrderCard extends StatelessWidget {
  final bool showActions;
  final Function() refuseOrder, acceptOrder;

  const CaptainOrderCard({super.key, required this.showActions, required this.refuseOrder, required this.acceptOrder});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 8,
      margin: const EdgeInsets.only(bottom: 12, left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("اوردر #12345", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.orange.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                  child: const Text('معلق', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const OrderRow(icon: Icons.person, text: "العميل: John Doe"),
            const SizedBox(height: 6),
            const OrderRow(icon: Icons.phone, text: "موبيل: +123456789"),
            const Divider(height: 20, thickness: 1),
            const OrderRow(icon: Icons.attach_money, text: "السعر: \$25.99"),
            const SizedBox(height: 6),
            const OrderRow(icon: Icons.location_on, text: "العنوان: 123 Street, City"),
            const SizedBox(height: 12),
            const OrderProgressLineComponent(currentStep: 0),
            const Divider(height: 20, thickness: 1),
            if (showActions)
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                OrderButton(icon: Icons.check_circle, label: "قبول الطلب", onTap: acceptOrder),
                OrderButton(icon: Icons.cancel, label: "رفض الطلب", onTap: refuseOrder),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const OrderRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: TextStyle(color: Colors.grey[800]))),
      ],
    );
  }
}

class OrderButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const OrderButton({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      icon: Icon(icon, size: 20),
      label: Text(label),
      onPressed: onTap,
    );
  }
}