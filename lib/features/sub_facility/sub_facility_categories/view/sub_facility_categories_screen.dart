import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlbne_getak/core/widgets/main_appbar.dart';
import 'package:otlbne_getak/core/widgets/primary_button.dart';

import '../../../../core/widgets/custom_text_form_feild.dart';
import '../model/sub_facility_category_model.dart';
import '../view_model/cubit/sub_facility_categories_cubit.dart';

class SubFacilityCategoriesScreen extends StatelessWidget {
  const SubFacilityCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const AppbarCenterTitle(title: "الفئات الرئيسية"),
      body: BlocProvider(
        create: (context) => SubFacilityCategoriesCubit(),
        child: BlocBuilder<SubFacilityCategoriesCubit, SubFacilityCategoriesState>(
          builder: (context, state) {
            var cubit = SubFacilityCategoriesCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'ابحث عن فئة...',
                    controller: cubit.searchController,
                    preffixIcon: const Icon(Icons.search, color: Colors.blue),
                  ).animate().fadeIn(duration: 300.ms),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.categories.length,
                      itemBuilder: (context, index) {
                        var cat = cubit.categories[index];
                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue.shade100,
                              child: Text(cat.englishName[0].toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            title: Text( cat.englishName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            subtitle: Text(cat.arabicName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () {
                                    _showCategoryDialog(context, cubit, cat, isEditing: true);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    text: 'إضافة فئة جديدة',
                    onTap: () {
                      _showCategoryDialog(context, cubit, null);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showCategoryDialog(BuildContext context, SubFacilityCategoriesCubit cubit, SubFacilityCategoryModel? category, {bool isEditing = false}) {
    final englishNameController = TextEditingController(text: category?.englishName ?? '');
    final arabicNameController = TextEditingController(text: category?.arabicName ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade100,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(isEditing ? 'تعديل الفئة' : 'إضافة فئة جديدة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                hintText: 'الاسم بالإنجليزية',
                controller: englishNameController,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                hintText: 'الاسم بالعربية',
                controller: arabicNameController,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(isEditing ? 'تحديث' : 'إضافة'),
            ),
          ],
        );
      },
    );
  }
}