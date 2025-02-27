import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_form_feild.dart';
import '../../../../core/widgets/main_appbar.dart';
import '../../../../core/widgets/primary_button.dart';
import '../view_model/cubit/sub_facility_products_cubit.dart';
import 'add_edit_products_screen.dart';

class SubFacilityProductsScreen extends StatelessWidget {
  const SubFacilityProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const AppbarCenterTitle(title: "المنتجات"),
      body: BlocProvider(
        create: (context) => SubFacilityProductsCubit(),
        child: BlocBuilder<SubFacilityProductsCubit, SubFacilityProductsState>(
          builder: (context, state) {
            var cubit = SubFacilityProductsCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'ابحث عن منتج...',
                    controller: cubit.searchController,
                    preffixIcon: const Icon(Icons.search, color: Colors.blue),
                  ).animate().fadeIn(duration: 300.ms),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.products.length,
                      itemBuilder: (context, index) {
                        var product = cubit.products[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                product.image,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/products_placeholder.png', width: 60, height: 60),
                              ),
                            ),
                            title: Text(product.englishName, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.arabicName),
                                Text("السعر: ${product.discPrice} ج.م"),
                                Text("التصنيف: ${product.category}"),
                                Text(product.status, style: TextStyle(color: product.status == 'Active' ? Colors.green : Colors.red)),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEditProductScreen())),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => cubit.deleteProduct(product.id),
                                ),
                              ],
                            ),
                          ).animate().fadeIn(duration: 300.ms),
                        );
                      },
                    ),
                  ),
                  PrimaryButton(
                    text: 'إضافة منتج جديد', 
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEditProductScreen())),
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