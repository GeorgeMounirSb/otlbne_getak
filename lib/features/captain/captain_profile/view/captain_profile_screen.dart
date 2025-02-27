import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/report_dates_widget.dart';
import '../../captain_components/captain_order_card.dart';
import '../view_model/cubit/captain_profile_cubit.dart';

class CaptainProfileScreen extends StatelessWidget {
  const CaptainProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocProvider(
        create: (context) => CaptainProfileCubit()..getProfile(context),
        child: BlocBuilder<CaptainProfileCubit, CaptainProfileState>(
          builder: (context, state) {
            var cubit = CaptainProfileCubit.get(context);
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 50, left: 24, right: 24, bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('الملف الشخصي', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.5)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('الاسم: ${cubit.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 2)),
                              Text('التليفون: ${cubit.phone}', style: const TextStyle(fontSize: 16, color: Colors.grey, height: 2)),
                            ],
                          ),
                          const Divider(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('حالة العمل:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Switch(value: cubit.isWorking, onChanged: (value) => cubit.changeWorkStatus(context)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.error,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              icon: const Icon(Icons.logout, size: 20),
                              label: const Text('تسجيل الخروج'),
                              onPressed: () => cubit.logout(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, left: 18, right: 18, bottom: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('سجل الطلبات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.5)),
                              const SizedBox(height: 10),
                              ReportDatesWidget(
                                startDateController: cubit.startDateController,
                                endDateController: cubit.endDateController,
                                pickDate: (ctx, isStart) => cubit.pickDate(context, isStart),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return CaptainOrderCard(
                                      showActions: false,
                                      acceptOrder: () {},
                                      refuseOrder: () {},
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if(cubit.isLoading) 
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}