import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/main_appbar.dart';
import '../view_model/cubit/sub_facility_info_cubit.dart';

class SubFacilityInfoDaysScreen extends StatelessWidget {
  const SubFacilityInfoDaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const AppbarCenterTitle(title: "مواعيد العمل"),
      body: BlocProvider(
        create: (context) => SubFacilityInfoCubit(),
        child: BlocBuilder<SubFacilityInfoCubit, SubFacilityInfoState>(
          builder: (context, state) {
            var cubit = SubFacilityInfoCubit.get(context);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: cubit.days.map((e) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade50, Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Day and Switch
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_today, size: 20, color: Colors.blue.shade600),
                                  const SizedBox(width: 8),
                                  Text(
                                    e.day,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                value: e.isHoliday,
                                onChanged: (value) => cubit.changeDayHoliday(e, value),
                                activeColor: Colors.red,
                                activeTrackColor: Colors.red.shade200,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Time Picker Buttons
                          if (!e.isHoliday)
                            Column(
                              children: [
                                const Divider(),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () => cubit.pickTime(context, e, true),
                                      icon: const Icon(Icons.access_time, size: 16, color: Colors.white),
                                      label: Text(
                                        "بداية: ${e.startTime.format(context)}",
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade600,
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () => cubit.pickTime(context, e, false),
                                      icon: const Icon(Icons.access_time, size: 16, color: Colors.white),
                                      label: Text(
                                        "نهاية: ${e.endTime.format(context)}",
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade600,
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}