import 'package:flutter/material.dart';

import '../../../../core/widgets/main_appbar.dart';
import '../components/sub_facility_info_component.dart';
import 'sub_facility_info_address_screen.dart';
import 'sub_facility_info_data_screen.dart';
import 'sub_facility_info_days_screen.dart';

class SubFacilityInfoScreen extends StatelessWidget {
  const SubFacilityInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const AppbarCenterTitle(title: "معلومات المتجر"),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 12),
            SubFacilityInfoComponent(title: 'مواعيد العمل', navigateTo: SubFacilityInfoDaysScreen()),
            SizedBox(height: 20),
            SubFacilityInfoComponent(title: 'معلومات المتجر', navigateTo: SubFacilityInfoDataScreen()),
            SizedBox(height: 20),
            SubFacilityInfoComponent(title: 'عنوان المتجر', navigateTo: SubFacilityInfoAddressScreen()),
          ],
        ),
      ),
    );
  }
}