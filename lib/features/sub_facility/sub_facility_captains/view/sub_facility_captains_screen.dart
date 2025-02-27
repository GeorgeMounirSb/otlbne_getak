import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/main_appbar.dart';
import '../../../../core/widgets/custom_text_form_feild.dart';
import '../../components/sub_facility_status_filter.dart';
import '../component/sub_facility_captains_component.dart';
import '../model/sub_facility_captains_model.dart';
import '../view_model/cubit/sub_facility_captain_cubit.dart';

class SubFacilityCaptainsScreen extends StatelessWidget {
  const SubFacilityCaptainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const AppbarCenterTitle(title: "سجل الطلبات"),
      body: BlocProvider(
        create: (context) => SubFacilityCaptainCubit()..getCaptainsData(),
        child: BlocBuilder<SubFacilityCaptainCubit, SubFacilityCaptainState>(
          builder: (context, state) {
            var cubit = SubFacilityCaptainCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'ابحث عن طلب...',
                    controller: cubit.searchController,
                    preffixIcon: const Icon(Icons.search, color: Colors.blue),
                    onChanged: (value) => cubit.filterOrders(),
                  ).animate().fadeIn(duration: 300.ms),
                  const SizedBox(height: 20),
                  SubFacilityOrdersFilterComponent(
                    onFilterChange: (filter) => cubit.changeStatus(filter),
                    selectedFilter: cubit.selectedStatus,
                    filters: cubit.statusOptions,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.filteredSubFacilityCaptains.length,
                      itemBuilder: (context, index) {
                        SubFacilityCaptainsModel captain = cubit.filteredSubFacilityCaptains[index];
                        cubit.switchStatus(captain.status);
                        return SubFacilityCaptainsComponent(captain: captain, icon: cubit.icon, color: cubit.bgColor);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showOrderCaptainBottomSheet(context),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  showOrderCaptainBottomSheet(BuildContext context) {
    String? selectedArea;
    List<String> egyptAreas = [
      // Cairo
      "وسط البلد", "الزمالك", "المهندسين", "مدينة نصر", "مصر الجديدة", 
      "التجمع الخامس", "الشروق", "الرحاب", "مدينتي", "المعادي", "المنيل", 
      "الدقي", "الهرم", "الجيزة", "6 أكتوبر", "الشيخ زايد", "حلوان", 

      // Alexandria
      "محطة الرمل", "سيدي جابر", "سموحة", "لوران", "ستانلي", "العجمي", 
      "المعمورة", "ميامي", "سان ستيفانو", "رشدي", "المنتزه", "كامب شيزار",

      // Giza
      "فيصل", "حدائق الأهرام", "العمرانية", "أبو النمرس", "البدرشين", 
      "الكريمات", "الوراق", "أوسيم",

      // Other Governorates
      "طنطا", "المنصورة", "دمياط", "بورسعيد", "الإسماعيلية", "السويس", 
      "أسيوط", "سوهاج", "قنا", "الأقصر", "أسوان", "الفيوم", "بني سويف", 
      "المنوفية", "كفر الشيخ", "الشرقية", "مطروح", "الوادي الجديد", "البحيرة"
    ];

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("طلب سائق", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: "اختر المنطقة"),
                items: egyptAreas.map((area) {
                  return DropdownMenuItem(value: area, child: Text(area));
                }).toList(),
                onChanged: (value) => selectedArea = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, selectedArea),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text("طلب", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }
}