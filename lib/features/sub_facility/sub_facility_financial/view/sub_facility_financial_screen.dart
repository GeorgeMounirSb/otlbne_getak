import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/report_dates_widget.dart';
import '../../../../core/widgets/custom_text_form_feild.dart';
import '../../../../core/widgets/main_appbar.dart';
import '../component/sub_facility_financial_component.dart';
import '../view_model/cubit/sub_facility_financial_cubit.dart';

class SubFacilityFinancialScreen extends StatelessWidget {
  const SubFacilityFinancialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const AppbarCenterTitle(title: "المعلومات المالية"),
      body: BlocProvider(
        create: (context) => SubFacilityFinancialCubit()..getFinancialData(),
        child: BlocBuilder<SubFacilityFinancialCubit, SubFacilityFinancialState>(
          builder: (context, state) {
            var cubit = SubFacilityFinancialCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'ابحث عن رقم الطلب أو اسم العميل...',
                    controller: cubit.searchController,
                    preffixIcon: const Icon(Icons.search, color: Colors.blue),
                    onChanged: (value) => cubit.filterFinancialData(),
                  ).animate().fadeIn(duration: 300.ms),
                  const SizedBox(height: 20),
                  ReportDatesWidget(
                    startDateController: cubit.startDateController, 
                    endDateController: cubit.endDateController, 
                    pickDate: (ctx, isStart) => cubit.pickDate(context, isStart),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: context.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("الطلبات"),
                            labelStyle: TextStyle(color: cubit.selectedTab == 'الطلبات' ? Colors.white : Colors.black),
                            checkmarkColor: Colors.white,
                            selected: cubit.selectedTab == 'الطلبات',
                            onSelected: (selected) => cubit.changeTab('الطلبات'),
                            selectedColor: Colors.green.shade400,
                            backgroundColor: Colors.white,
                            side: BorderSide(color: cubit.selectedTab == 'الطلبات' ? Colors.transparent : ColorsManager.dark),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ChoiceChip(
                            label: const Text("الدفعات"),
                            labelStyle: TextStyle(color: cubit.selectedTab == 'الدفعات' ? Colors.white : Colors.black),
                            checkmarkColor: Colors.white,
                            selected: cubit.selectedTab == 'الدفعات',
                            onSelected: (selected) => cubit.changeTab('الدفعات'),
                            selectedColor: Colors.green.shade400,
                            backgroundColor: Colors.white,
                            side: BorderSide(color: cubit.selectedTab == 'الدفعات' ? Colors.transparent : ColorsManager.dark),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.filteredFinancialData.length,
                      itemBuilder: (context, index) {
                        var item = cubit.filteredFinancialData[index];
                        return SubFacilityFinancialComponent(
                          item: item, 
                          color: item.type == "الطلبات" ? Colors.green : Colors.blue,
                          icon: item.type == "الطلبات" ? Icons.shopping_cart : Icons.payments,
                        );
                      },
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