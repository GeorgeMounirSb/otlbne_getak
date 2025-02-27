import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../sub_facility_categories/view/sub_facility_categories_screen.dart';
import '../../sub_facility_captains/view/sub_facility_captains_screen.dart';
import '../../sub_facility_financial/view/sub_facility_financial_screen.dart';
import '../../sub_facility_info/view/sub_facility_info_screen.dart';
import '../../sub_facility_orders_reservations/view/sub_facility_orders_screen.dart';
import '../../sub_facility_products/view/sub_facility_products_screen.dart';
import '../components/sub_facility_category_component.dart';
import '../components/sub_facility_dashboard_component.dart';
import '../components/sub_facility_latest_products.dart';
import '../model/sub_facility_home_categories_model.dart';

class SubFacilityHomeScreen extends StatelessWidget {
  const SubFacilityHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SubFacilityHomeCategoriesModel> options = [
      SubFacilityHomeCategoriesModel(label: 'الطلبات', icon: LucideIcons.shoppingBag, navigateTo: const SubFacilityOrdersScreen(isReservation: false)),
      SubFacilityHomeCategoriesModel(label: 'طلب سائق', icon: LucideIcons.truck, navigateTo: const SubFacilityCaptainsScreen()),
      SubFacilityHomeCategoriesModel(label: 'الحجوزات', icon: LucideIcons.calendar, navigateTo: const SubFacilityOrdersScreen(isReservation: true)),
      SubFacilityHomeCategoriesModel(label: 'الفئات الرئيسية', icon: LucideIcons.grid, navigateTo: const SubFacilityCategoriesScreen()),
      SubFacilityHomeCategoriesModel(label: 'المنتجات', icon: LucideIcons.box, navigateTo: const SubFacilityProductsScreen()),
      SubFacilityHomeCategoriesModel(label: 'المالية', icon: LucideIcons.dollarSign, navigateTo: const SubFacilityFinancialScreen()),
      SubFacilityHomeCategoriesModel(label: 'معلومات المتجر', icon: LucideIcons.store, navigateTo: const SubFacilityInfoScreen()),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('لوحة التحكم الفرعية', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SubFacilityDashboardComponent(waitingOrders: '8', waitingReservations: '12', ordersCount: '120', totalSales: '\$5,320'),
              const SizedBox(height: 20),
              const SubFacilityLatestProducts(),
              const SizedBox(height: 20),
              const Align(
                alignment: AlignmentDirectional.centerStart, 
                child: Text('الأقسام', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options[index];
                  return SubFacilityCategoryComponent(
                    label: option.label, 
                    icon: option.icon, 
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => option.navigateTo)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}