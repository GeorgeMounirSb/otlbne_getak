import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../user_home/components/user_home_screen_bar_component.dart';
import '../../user_home/model/user_home_facilities_model.dart';
import '../../user_medical_facilities/components/medical_image_filter_component.dart';
import '../components/cars_facility_component.dart';
import '../view_model/cubit/user_cars_facilities_cubit.dart';

class MainCarsFacilityScreen extends StatelessWidget {
  final UserHomeFacilitiesModel facility;
  const MainCarsFacilityScreen({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocProvider(
        create: (context) => UserCarsFacilitiesCubit(),
        child: BlocBuilder<UserCarsFacilitiesCubit, UserCarsFacilitiesState>(
          builder: (context, state) {
            var cubit = UserCarsFacilitiesCubit.get(context);
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
                              children: cubit.carsTypes.map((e) {
                                return MedicalImageFilterComponent(
                                  selectFilter: () => cubit.selectType(e),
                                  isSelected: cubit.selectedType == e,
                                  img: cubit.typesImages[cubit.carsTypes.indexOf(e)],
                                  title: e,
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 24),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.filteredFacilities.length,
                            itemBuilder: (context, index) {
                              var fac = cubit.filteredFacilities[index];
                              return CarsFacilityComponent(
                                fac: fac,
                                navigateTo: Container(),
                              );
                            },
                          ),
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