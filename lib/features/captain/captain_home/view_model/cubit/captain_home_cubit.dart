// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;

import '../../../../../core/helper/cache_helper.dart';
import '../../../../../core/helper/data_helper.dart';
import '../../../../../core/helper/http_helper.dart';
import '../../../../../core/helper/user_location_service.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../core/widgets/toast_widget.dart';

part 'captain_home_state.dart';

class CaptainHomeCubit extends Cubit<CaptainHomeState> {
  CaptainHomeCubit() : super(CaptainHomeCubitInitial());

  static CaptainHomeCubit get(context) => BlocProvider.of(context);

  bool homeLoading = false, availableForWork = false, availableOrders = false;
  loc.LocationData? currentPosition;
  String currentCountry = "";
  late loc.Location location;
  UserLocationService locationService = UserLocationService();

  checkWorkAvailability(BuildContext context) async {
    try {
      homeLoading = true;
      emit(CaptainHomeCubitLoaded());
      final instance = DataHelper.instance;
      final body = {'idder': instance.id.toString()};
      final response = await HTTPHelper.httpPost(context, EndPoints.captProfile, body);
      final data = jsonDecode(response);
      if(data['success'] == true) {
        availableForWork = data['is_onduty'] == 1;
      }
    }catch (e) {
      ToastWidget().showToast(context, message: 'حدث خطأ اثناء التحقق من العمل');
    }
    homeLoading = false;
    emit(AvailableForWork());
  }
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
  }
  stopWork(BuildContext context) async => await updateOnduty(context, DataHelper.instance.id!);
  startWork(BuildContext context) async {
    homeLoading = true;
    emit(AvailableForWork());
    await getLocation();
    if (currentPosition != null) await updateLocation(context);
    homeLoading = false;
    emit(CaptainHomeCubitLoaded());
    
    ///for test front purpose
    await Future.delayed(const Duration(seconds: 3));
    availableOrders = true;
    emit(AvailableOrders());
  }
  refuseOrder() async {
    availableOrders = false;
    emit(RefuseOrder());
    await Future.delayed(const Duration(seconds: 3));
    availableOrders = true;
    emit(AvailableOrders());
  }
  acceptOrder(double lat, double long) async {}
  ///update current location for db
  updateOnduty(BuildContext context, int id) async {
    try {
      final body = {
        'rider_id': id.toString(),
        'is_onduty': availableForWork ? '0' : '1',
      };
      final response = await HTTPHelper.httpPost(context, EndPoints.updateOnduty, body);
      final data = jsonDecode(response);
      if(data['success'] == true) {
        availableForWork = !availableForWork;
        emit(AvailableForWork());
      }
    }catch (e) {
      ToastWidget().showToast(context, message: 'حدث خطأ اثناء بدأ العمل');
    }
  }
  updateLocation(BuildContext context) async {
    try {
      final instance = DataHelper.instance;
      final body = {
        'idder': instance.id.toString(),
        'latitude': currentPosition!.latitude.toString(),
        'longitude': currentPosition!.longitude.toString(),
      };
      final response = await HTTPHelper.httpPost(context, EndPoints.updateLocation, body);
      final data = jsonDecode(response);
      if(data['success'] == true) {
        await updateOnduty(context, instance.id!);
      }
    } catch(e) {
      ToastWidget().showToast(context, message: 'حدث خطأ اثناء تحديث الموقع');
    }
  }

  @override
  Future<void> close() async {
    location.onLocationChanged.drain();
    return super.close();
  }
}