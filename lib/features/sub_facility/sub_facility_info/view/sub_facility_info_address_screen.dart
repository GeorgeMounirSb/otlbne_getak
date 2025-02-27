import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlbne_getak/core/theming/colors.dart';
import 'package:otlbne_getak/core/widgets/primary_button.dart';

import '../../../../core/widgets/main_appbar.dart';
import '../../../../core/widgets/custom_text_form_feild.dart';
import '../view_model/cubit/sub_facility_info_cubit.dart';

class SubFacilityInfoAddressScreen extends StatelessWidget {
  const SubFacilityInfoAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const AppbarCenterTitle(title: 'عنوان المتجر'),
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
                    CustomTextFormField(hintText: "اسم الشخص المعني", controller: cubit.contactPersonController),
                    const SizedBox(height: 16),
                    CustomTextFormField(hintText: "رقم الهاتف", controller: cubit.phoneController),
                    const SizedBox(height: 16),
                    CustomTextFormField(hintText: "المدينة", controller: cubit.cityController),
                    const SizedBox(height: 16),
                    CustomTextFormField(hintText: "المنطقة", controller: cubit.areaController),
                    const SizedBox(height: 16),
                    CustomTextFormField(hintText: "الشارع", controller: cubit.streetController),
                    const SizedBox(height: 16),
                    CustomTextFormField(hintText: "المبنى", controller: cubit.buildingController),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: CustomTextFormField(hintText: "خطوط الطول", controller: cubit.latController)),
                        const SizedBox(width: 16),
                        Expanded(child: CustomTextFormField(hintText: "خطوط العرض", controller: cubit.lngController)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      text: 'حدد الموقع الحالي', 
                      backgroundColor: ColorsManager.error,
                      onTap: () {},
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