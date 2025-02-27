import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;

import '../../../../../core/helper/cache_helper.dart';
import '../../../../../core/helper/user_location_service.dart';
import '../../model/user_home_categories_model.dart';
import '../../model/user_home_facilities_model.dart';
import '../../model/user_home_most_selling_model.dart';
import '../../model/user_home_offers_model.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit() : super(UserHomeInitial());

  static UserHomeCubit get(context) => BlocProvider.of(context);

  bool homeLoading = false, availableLocation = false, locationSkipped = false;
  loc.LocationData? currentPosition;
  String currentCountry = "";
  List<String> ads = [
    'assets/images/ad1.png',
    'assets/images/ad1.png',
    'assets/images/ad1.png',
    'assets/images/ad1.png',
  ];
  List<UserHomeCategoriesModel> categories = [
    UserHomeCategoriesModel(img: 'assets/images/cate_restaurants.png', title: 'مطاعم'),
    UserHomeCategoriesModel(img: 'assets/images/cate_tamween.png', title: 'تموين'),
    UserHomeCategoriesModel(img: 'assets/images/cate_medical.png', title: 'طبي'),
    UserHomeCategoriesModel(img: 'assets/images/cate_education.png', title: 'تعليم'),
    UserHomeCategoriesModel(img: 'assets/images/cate_cars.png', title: 'سيارات'),
    UserHomeCategoriesModel(img: 'assets/images/cate_electronies.png', title: 'الكترونيات'),
  ];
  List<UserHomeOffersModel> offers = [
    UserHomeOffersModel(img: 'assets/images/offer1.png', name: 'فطار صحي', rate: '4.5', currentPrice: '154 ر.س', oldPrice: '160 ر.س'),
    UserHomeOffersModel(img: 'assets/images/offer2.png', name: 'فطار صحي', rate: '4.5', currentPrice: '154 ر.س', oldPrice: '160 ر.س'),
    UserHomeOffersModel(img: 'assets/images/offer3.png', name: 'فطار صحي', rate: '4.5', currentPrice: '154 ر.س', oldPrice: '160 ر.س'),
    UserHomeOffersModel(img: 'assets/images/offer4.png', name: 'فطار صحي', rate: '4.5', currentPrice: '154 ر.س', oldPrice: '160 ر.س'),
  ];
  List<UserHomeMostSellingModel> mostProducts = [
    UserHomeMostSellingModel(img: 'assets/images/offer4.png', name: 'مطعم أكلة و أكلة', rate: '4.5', reviews: '458'),
    UserHomeMostSellingModel(img: 'assets/images/offer4.png', name: 'مطعم أكلة و أكلة', rate: '4.5', reviews: '458'),
    UserHomeMostSellingModel(img: 'assets/images/offer4.png', name: 'مطعم أكلة و أكلة', rate: '4.5', reviews: '458'),
    UserHomeMostSellingModel(img: 'assets/images/offer4.png', name: 'مطعم أكلة و أكلة', rate: '4.5', reviews: '458'),
  ];
  List<UserHomeFacilitiesModel> facilities = [
    ///restaurants
    UserHomeFacilitiesModel(type: 'restaurants', img: 'assets/images/fac_restaurants.png', name: 'مطعم', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'restaurants', img: 'assets/images/fac_restaurants.png', name: 'مطعم', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'restaurants', img: 'assets/images/fac_restaurants.png', name: 'مطعم', time: '10 min', price: '50 ر.س'),
    ///supplies
    UserHomeFacilitiesModel(type: 'supplies', img: 'assets/images/fac_supply.png', name: 'تموين', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'supplies', img: 'assets/images/fac_supply.png', name: 'تموين', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'supplies', img: 'assets/images/fac_supply.png', name: 'تموين', time: '10 min', price: '50 ر.س'),
    ///medical
    UserHomeFacilitiesModel(type: 'medical', img: 'assets/images/fac_clinics.png', name: 'طبي', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'medical', img: 'assets/images/fac_clinics.png', name: 'طبي', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'medical', img: 'assets/images/fac_clinics.png', name: 'طبي', time: '10 min', price: '50 ر.س'),
    ///education
    UserHomeFacilitiesModel(type: 'education', img: 'assets/images/fac_education.png', name: 'تعليم', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'education', img: 'assets/images/fac_education.png', name: 'تعليم', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'education', img: 'assets/images/fac_education.png', name: 'تعليم', time: '10 min', price: '50 ر.س'),
    ///cars
    UserHomeFacilitiesModel(type: 'cars', img: 'assets/images/fac_cars.png', name: 'سيارات', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'cars', img: 'assets/images/fac_cars.png', name: 'سيارات', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'cars', img: 'assets/images/fac_cars.png', name: 'سيارات', time: '10 min', price: '50 ر.س'),
    ///electronies
    UserHomeFacilitiesModel(type: 'electronies', img: 'assets/images/fac_electrics.png', name: 'الكترونيات', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'electronies', img: 'assets/images/fac_electrics.png', name: 'الكترونيات', time: '10 min', price: '50 ر.س'),
    UserHomeFacilitiesModel(type: 'electronies', img: 'assets/images/fac_electrics.png', name: 'الكترونيات', time: '10 min', price: '50 ر.س'),
  ];
  
  UserLocationService locationService = UserLocationService();
  getLocation() async {
    await locationService.initLocation();
    await locationService.activeLocation();
    await getLocationData();
  }
  getLocationData() async{
    String? lastCountry = await CacheHelper.getData('last_country', String);
    currentCountry = lastCountry ?? '';
    String? lastLocation = await CacheHelper.getData('last_location', String);
    if(lastLocation != null) {
      List<String> locationData = lastLocation.split(',');
      currentPosition = loc.LocationData.fromMap({
        'latitude': double.parse(locationData[0]),
        'longitude': double.parse(locationData[1]),
      });
    }
    if(currentPosition != null && currentCountry.isNotEmpty) {
      availableLocation = true;
      emit(LocationEnabled());
    }
  }
  skipLocation() {
    locationSkipped = true;
    emit(LocationDisabled());
  }
}