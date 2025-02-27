import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otlbne_getak/core/utils/media_query_values.dart';

import '../../../../core/widgets/primary_button.dart';
import '../../user_home/components/user_home_screen_bar_component.dart';
import '../components/basic_filter_component.dart';
import '../components/hospital_date_component.dart';
import '../components/medical_image_filter_component.dart';
import '../model/medical_facility_model.dart';
import '../view_model/cubit/user_medical_facility_cubit.dart';

class UserHospitalScreen extends StatelessWidget {
  final MedicalFacilityModel facility;
  const UserHospitalScreen({super.key, required this.facility});

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
                            const Text('حجز غرفة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 24),
                            Align(alignment: Alignment.center, child: Image.asset(cubit.bedsNumber == 1 ? 'assets/images/single_bed.png' : 'assets/images/double_bed.png')),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.grey.shade300),
                                  ),
                                  child: DropdownButton<String>(
                                    value: cubit.selectedRoom,
                                    underline: const SizedBox.shrink(),
                                    hint: const Text('نوع الغرفة', style: TextStyle(fontWeight: FontWeight.w400)),
                                    items: ['first class', 'second class'].map((e) {
                                      return DropdownMenuItem<String>(value: e, child: Text(e));
                                    }).toList(), 
                                    onChanged: (val) {},
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Text('عدد الأسرة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    ...[1,2].map((e) {
                                      return InkWell(
                                        onTap: () => cubit.changeBedsNumber(e),
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          margin: const EdgeInsets.symmetric(horizontal: 4),
                                          decoration: BoxDecoration(
                                            color: cubit.bedsNumber >= e ? Colors.blue : null,
                                            border: Border.all(color: Colors.blue),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(e.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: cubit.bedsNumber >= e ? Colors.white : Colors.blue)),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Container(
                              width: context.width,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: HexColor("#EAEAEA"), width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  HospitalDateComponent(title: 'بداية', value: ' 12يونيه/2024 ', selectDate: () {}),
                                  Divider(color: HexColor("#EAEAEA")),
                                  HospitalDateComponent(title: 'نهاية', value: ' 12يونيه/2024 ', selectDate: () {}),
                                ],
                              ),
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