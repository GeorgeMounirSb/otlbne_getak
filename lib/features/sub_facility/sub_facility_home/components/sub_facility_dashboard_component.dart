import 'package:flutter/material.dart';

class SubFacilityDashboardComponent extends StatelessWidget {
  final String waitingOrders, waitingReservations, ordersCount, totalSales;
  const SubFacilityDashboardComponent({
    super.key,
    required this.waitingOrders,
    required this.waitingReservations,
    required this.ordersCount,
    required this.totalSales,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DashboardItem(
                  title: 'حجوزات بالانتظار',
                  value: waitingReservations,
                  icon: Icons.schedule,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DashboardItem(
                  title: 'طلبات بالانتظار',
                  value: waitingOrders,
                  icon: Icons.shopping_cart,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DashboardItem(
                  title: 'عدد الطلبات',
                  value: ordersCount,
                  icon: Icons.assignment,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DashboardItem(
                  title: 'مجموع البيع',
                  value: totalSales,
                  icon: Icons.attach_money,
                  color: Colors.green,
                  showIcon: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final bool? showIcon;

  const DashboardItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(4, 4),
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 6,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              if(showIcon == null || showIcon == true)
              Icon(icon, size: 32, color: color),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}