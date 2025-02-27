import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlbne_getak/features/sub_facility/sub_facility_orders_reservations/view_model/cubit/sub_facility_orders_cubit.dart';

import '../../../../core/widgets/custom_text_form_feild.dart';
import '../../../../core/widgets/main_appbar.dart';
import '../components/sub_facility_order_row_component.dart';
import '../../components/sub_facility_status_filter.dart';

class SubFacilityOrdersScreen extends StatelessWidget {
  final bool isReservation;
  const SubFacilityOrdersScreen({super.key, required this.isReservation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppbarCenterTitle(title: isReservation ? "الحجوزات" : "الطلبات"),
      body: BlocProvider(
        create: (context) => SubFacilityOrdersCubit()..setFilters(isReservation)..filterOrders(),
        child: BlocBuilder<SubFacilityOrdersCubit, SubFacilityOrdersState>(
          builder: (context, state) {
            var cubit = SubFacilityOrdersCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: isReservation ? 'ابحث عن حجز...' : 'ابحث عن طلب...',
                    controller: cubit.searchController,
                    preffixIcon: const Icon(Icons.search, color: Colors.blue),
                    onChanged: (value) => cubit.filterOrders(),
                  ).animate().fadeIn(duration: 300.ms),
                  const SizedBox(height: 20),
                  SubFacilityOrdersFilterComponent(
                    onFilterChange: (filter) => cubit.changeOrdersStatus(filter),
                    selectedFilter: cubit.selectedFilter,
                    filters: cubit.filters,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: 300.ms,
                      child: cubit.filteredOrders.isEmpty
                          ? Center(
                              child: Text(
                                isReservation ? "لا توجد حجوزات" : "لا توجد طلبات",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: cubit.filteredOrders.length,
                              itemBuilder: (context, index) {
                                final order = cubit.filteredOrders[index];
                                return InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
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
                                    child: ListTile(
                                      leading: cubit.getStatusIcon(order.status),
                                      title: Text(
                                        "المرجع: ${order.id}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 8),
                                          SubFacilityOrderRowComponent(icon: Icons.person, label: order.client),
                                          const SizedBox(height: 4),
                                          SubFacilityOrderRowComponent(icon: Icons.phone, label: order.phone),
                                          const SizedBox(height: 4),
                                          SubFacilityOrderRowComponent(icon: Icons.attach_money, label: order.total),
                                        ],
                                      ),
                                      trailing: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              cubit.getStatusColor(order.status),
                                              cubit.getStatusColor(order.status).withOpacity(0.8),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          order.status,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).animate().fadeIn(duration: 300.ms),
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}