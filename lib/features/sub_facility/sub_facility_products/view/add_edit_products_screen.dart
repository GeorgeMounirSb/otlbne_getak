import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_drop_down_button_field.dart';
import '../../../../core/widgets/custom_text_form_feild.dart';
import '../../../../core/widgets/main_appbar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../view_model/cubit/sub_facility_products_cubit.dart';

class AddEditProductScreen extends StatelessWidget {
  final bool isEdit;
  final String? productId;

  const AddEditProductScreen({super.key, this.isEdit = false, this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppbarCenterTitle(title: isEdit ? "تعديل المنتج" : "إضافة منتج"),
      body: BlocProvider(
        create: (context) => SubFacilityProductsCubit()..loadProductData(productId),
        child: BlocBuilder<SubFacilityProductsCubit, SubFacilityProductsState>(
          builder: (context, state) {
            var cubit = SubFacilityProductsCubit.get(context);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      // onTap: cubit.pickImage,
                      child: const CircleAvatar(
                        radius: 50,
                        // backgroundImage: cubit.image != null
                        //     ? FileImage(cubit.image!)
                        //     : const AssetImage("assets/images/placeholder.png") as ImageProvider,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      hintText: 'اسم المنتج بالإنجليزية',
                      controller: cubit.englishNameController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: 'اسم المنتج بالعربية',
                      controller: cubit.arabicNameController,
                    ),
                    const SizedBox(height: 16),
                    CustomDropdownButtonField(
                      items: const ['برجر', 'بيتزا', 'شوربة'],
                      value: cubit.selectedCategory,
                      onChanged: (value) => cubit.changeType(value),
                      hintText: 'الفئة',
                    ),
                    const SizedBox(height: 16),
                    CustomDropdownButtonField(
                      items: const ['منتج', 'حجز'],
                      value: cubit.selectedType,
                      onChanged: (value) => cubit.changeType(value),
                      hintText: 'نوع المنتج',
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: 'السعر',
                      controller: cubit.priceController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: 'السعر بعد الخصم',
                      controller: cubit.discPriceController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: 'الوصف',
                      controller: cubit.descriptionController,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("الحالة:"),
                        Switch(
                          value: cubit.status,
                          onChanged: (value) => cubit.toggleStatus(value),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      text: isEdit ? 'حفظ التعديلات' : 'إضافة المنتج',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}