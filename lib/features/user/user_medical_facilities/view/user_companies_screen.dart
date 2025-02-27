import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlbne_getak/core/utils/media_query_values.dart';
import 'package:otlbne_getak/features/user/search/components/search_component.dart';

import '../../../../core/widgets/primary_button.dart';
import '../../user_home/components/user_home_screen_bar_component.dart';
import '../components/basic_filter_component.dart';
import '../model/medical_facility_model.dart';
import '../view_model/cubit/user_medical_facility_cubit.dart';

class UserCompaniesScreen extends StatelessWidget {
  final MedicalFacilityModel facility;
  const UserCompaniesScreen({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocProvider(
        create: (context) => UserMedicalFacilityCubit(),
        child: BlocBuilder<UserMedicalFacilityCubit, UserMedicalFacilityState>(
          builder: (context, state) {
            var cubit = UserMedicalFacilityCubit.get(context);
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    UserHomeScreenBarComponent(
                      img: 'assets/images/profile_img.png', 
                      name: 'أهلا,محمد  حسن', 
                      activeLocation: () => cubit.getLocation(),
                      showCart: false,
                      openCart: () {},
                    ),
                    Image.asset(facility.img, height: 250, width: double.infinity, fit: BoxFit.cover),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: cubit.specialityFilters.map((spec) {
                                return BasicFilterComponent(
                                  selectFilter: () => cubit.selectSpeciality(spec),
                                  isSelected: cubit.selectedSpeciality == spec,
                                  title: spec,
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 24),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.products.length,
                            itemBuilder: (context, index) {
                              var pro = cubit.products[index];
                              return SearchComponent(img: pro.img, title: pro.title, description: pro.description, pricing: pro.pricing);
                            },
                          ),
                          const SizedBox(height: 24),
                          PrimaryButton(text: 'حجز موعد', width: context.width, onTap: () {}),
                          const SizedBox(height: 24),
                        ],
                      ),
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