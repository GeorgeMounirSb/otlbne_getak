import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/user_location_service.dart';
import '../../../search/model/search_model.dart';
import '../../model/medical_facility_model.dart';
import '../../model/medical_doctors_model.dart';
import '../../view/user_clinics_screen.dart';
import '../../view/user_companies_screen.dart';
import '../../view/user_hospital_screen.dart';

part 'user_medical_facility_state.dart';

class UserMedicalFacilityCubit extends Cubit<UserMedicalFacilityState> {
  UserMedicalFacilityCubit() : super(UserMedicalFacilityInitial());

  static UserMedicalFacilityCubit get(context) => BlocProvider.of(context);

  List<String> medicalTypes = ['مستشفيات', 'عيادات', 'شركات طبية'];
  List<String> typesImages = ['assets/images/hospitals.png', 'assets/images/clinics.png', 'assets/images/companies.png'];
  String selectedType = 'مستشفيات', selectedDoctor = '1', selectedTime = '';
  List<String> specialityFilters = ['أسنان', 'حشو', 'تقويم', 'تبييض', 'زراعة', 'تركيب'];
  String selectedSpeciality = '';
  MedicalDoctorsModel? currentDoctor;
  int bedsNumber = 1;
  String? selectedRoom;
  UserLocationService locationService = UserLocationService();
  List<MedicalFacilityModel> filteredFacilities = [
    MedicalFacilityModel(id: '1', title: 'مستشفى القوات المسلحة', dr: 'د. محمد علي', rate: '4.5', reviews: '458', img: 'assets/images/offer1.png'),
    MedicalFacilityModel(id: '2', title: 'مستشفى القوات المسلحة', dr: 'د. محمد علي', rate: '4.5', reviews: '458', img: 'assets/images/offer1.png'),
    MedicalFacilityModel(id: '3', title: 'مستشفى القوات المسلحة', dr: 'د. محمد علي', rate: '4.5', reviews: '458', img: 'assets/images/offer1.png'),
  ];
  List<MedicalDoctorsModel> doctors = [
    MedicalDoctorsModel(id: '1', name: 'د. محمد علي', img: 'assets/images/doctor.png'),
    MedicalDoctorsModel(id: '2', name: 'د. محمد علي', img: 'assets/images/doctor.png'),
    MedicalDoctorsModel(id: '3', name: 'د. محمد علي', img: 'assets/images/doctor.png'),
  ];
  List<SearchModel> products = [
    SearchModel(img: 'assets/images/offer4.png', title: 'فولتارين جل', description: 'مسكن الم', pricing: '560 ر.س'),
    SearchModel(img: 'assets/images/offer4.png', title: 'بنادول', description: 'مسكن الم', pricing: '560 ر.س'),
    SearchModel(img: 'assets/images/offer4.png', title: 'ابيمول', description: 'مسكن الم', pricing: '560 ر.س'),
    SearchModel(img: 'assets/images/offer4.png', title: 'فولتارين جل', description: 'مسكن الم', pricing: '560 ر.س'),
  ];

  getLocation() async {
    await locationService.initLocation();
    await locationService.activeLocation();
  }
  Widget switchScreen(MedicalFacilityModel facility) {
    switch(selectedType) {
      case 'مستشفيات':
        return UserHospitalScreen(facility: facility);
      case 'عيادات':
        return UserClinicsScreen(facility: facility);
      case 'شركات طبية':
        return UserCompaniesScreen(facility: facility);
      default:
        return Container();
    }
  }
  selectType(String type) {
    selectedType = type;
    emit(MedicalTypeSelected());
  }
  selectAppTime(String time) {
    selectedTime = time;
    emit(MedicalTypeSelected());
  }
  selectSpeciality(String spec) {
    selectedSpeciality = spec;
    emit(MedicalTypeSelected());
  }
  changeBedsNumber(int number) {
    bedsNumber = number;
    emit(MedicalTypeSelected());
  }
  selectDoctor(String docId) {
    selectedDoctor = docId;
    currentDoctor = doctors.firstWhere((element) => element.id == docId);
    selectedTime = '';
    emit(MedicalTypeSelected());
  }
}