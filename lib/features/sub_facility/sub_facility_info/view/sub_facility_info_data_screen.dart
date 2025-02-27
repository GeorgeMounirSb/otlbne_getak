import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_form_feild.dart';
import '../../../../core/widgets/main_appbar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../view_model/cubit/sub_facility_info_cubit.dart';

class SubFacilityInfoDataScreen extends StatelessWidget {
  const SubFacilityInfoDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const AppbarCenterTitle(title: 'معلومات المتجر'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) => SubFacilityInfoCubit(),
          child: BlocBuilder<SubFacilityInfoCubit, SubFacilityInfoState>(
            builder: (context, state) {
              var cubit = SubFacilityInfoCubit.get(context);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFormField(hintText: "الاسم بالعربية", controller: cubit.arabicNameController),
                    const SizedBox(height: 16),
                    CustomTextFormField(hintText: "الاسم بالإنجليزية", controller: cubit.englishNameController),
                    const SizedBox(height: 16),
                    CustomTextFormField(hintText: "الوصف بالعربية", controller: cubit.arabicDescController, maxLines: 3),
                    const SizedBox(height: 16),
                    CustomTextFormField(hintText: "الوصف بالإنجليزية", controller: cubit.englishDescController, maxLines: 3),
                    const SizedBox(height: 16),
                    CustomTextFormField(hintText: "أقل قيمة للطلب (بالدينار)", controller: cubit.minOrderController, keyboardType: TextInputType.number),
                    const SizedBox(height: 16),
                    CustomTextFormField(hintText: "نسبة الخصم على المبيعات (%)", controller: cubit.discountController, keyboardType: TextInputType.number),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("الحالة", style: TextStyle(fontSize: 16)),
                          Switch(
                            value: cubit.facilityActive,
                            onChanged: (value) => cubit.changeFacilityAvailability(value),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 24),
                    PrimaryButton(
                      text: 'حفظ', 
                      onTap: () {},
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
