import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/user_location_service.dart';
import '../../../user_home/model/user_home_facilities_model.dart';
import '../../model/cars_facility_model.dart';

part 'user_cars_facilities_state.dart';

class UserCarsFacilitiesCubit extends Cubit<UserCarsFacilitiesState> {
  UserCarsFacilitiesCubit() : super(UserCarsFacilitiesInitial());

  static UserCarsFacilitiesCubit get(context) => BlocProvider.of(context);

  UserLocationService locationService = UserLocationService();
  List<String> carsTypes = ['ايجار', 'شراء', 'صيانة'];
  List<String> typesImages = ['assets/images/rent.png', 'assets/images/sell.png', 'assets/images/fix.png'];
  String selectedType = 'ايجار';
  List<CarsFacilityModel> filteredFacilities = [
    CarsFacilityModel(id: '1', title: 'مستشفى القوات المسلحة', time: '20 د', rate: '4.5', reviews: '458', img: 'assets/images/offer1.png'),
    CarsFacilityModel(id: '2', title: 'مستشفى القوات المسلحة', time: '20 د', rate: '4.5', reviews: '458', img: 'assets/images/offer1.png'),
    CarsFacilityModel(id: '3', title: 'مستشفى القوات المسلحة', time: '20 د', rate: '4.5', reviews: '458', img: 'assets/images/offer1.png'),
  ];

  getLocation() async {
    await locationService.initLocation();
    await locationService.activeLocation();
  }
  Widget switchScreen(UserHomeFacilitiesModel facility) {
    switch(selectedType) {
      case 'ايجار':
        return Container();
      case 'شراء':
        return Container();
      case 'صيانة':
        return Container();
      default:
        return Container();
    }
  }
  selectType(String type) {
    selectedType = type;
    emit(TypeChanged());
  }
}
