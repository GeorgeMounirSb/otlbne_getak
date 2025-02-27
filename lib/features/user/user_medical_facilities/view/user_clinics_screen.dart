import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../user_home/components/user_home_screen_bar_component.dart';
import '../components/basic_filter_component.dart';
import '../components/medical_image_filter_component.dart';
import '../model/medical_facility_model.dart';
import '../view_model/cubit/user_medical_facility_cubit.dart';

class UserClinicsScreen extends StatelessWidget {
  final MedicalFacilityModel facility;
  const UserClinicsScreen({super.key, required this.facility});

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
                          const Text('الدكتور', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: cubit.doctors.map((doc) {
                                return MedicalImageFilterComponent(
                                  selectFilter: () => cubit.selectDoctor(doc.id),
                                  isSelected: cubit.selectedDoctor == doc.id,
                                  img: doc.img,
                                  title: doc.name,
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 24),
                          if(cubit.currentDoctor != null)
                          ...[
                            const Text('المواعيد المتاحة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 16),
                            GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 2),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cubit.currentDoctor!.appointments.length,
                              itemBuilder: (context, index) {
                                var app = cubit.currentDoctor!.appointments[index];
                                return InkWell(
                                  onTap: app.isAvailable ? () => cubit.selectAppTime(app.time) : null,
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: app.isAvailable ? (cubit.selectedTime == app.time ? Colors.blue.shade300 : Colors.grey.shade300) : HexColor('#D6EFF8'),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(app.time, style: TextStyle(fontSize: 16, color: !app.isAvailable ? Colors.grey : cubit.selectedTime == app.time ? Colors.white : Colors.black)),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                          ],
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