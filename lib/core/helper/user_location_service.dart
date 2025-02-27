import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;

import 'cache_helper.dart';

class UserLocationService {
  loc.LocationData? currentPosition;
  String currentCountry = "";
  late loc.Location location;
  bool availableLocation = false;

  initLocation() => location = loc.Location();

  activeLocation() async {
    if (!availableLocation) {
      availableLocation = await checkLocationPermission() && await checkLocationService();
    }else {
      await getCurrentLocation();
    }
  }

  Future<bool> checkLocationPermission() async {
    loc.PermissionStatus hasPermission = await location.hasPermission();
    if (hasPermission == loc.PermissionStatus.denied) {
      hasPermission = await location.requestPermission();
    }
    return hasPermission == loc.PermissionStatus.granted;
  }

  Future<bool> checkLocationService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }

  getCurrentLocation() async {
    try {
      currentPosition = await location.getLocation();
      if (currentPosition != null) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition!.latitude!,
          currentPosition!.longitude!,
        );
        if (placemarks.isNotEmpty) {
          Placemark place = placemarks.first;
          currentCountry = place.isoCountryCode ?? "Unknown Country";
        }
        await CacheHelper.setData('last_location', '${currentPosition!.latitude.toString()},${currentPosition!.longitude.toString()}');
        await CacheHelper.setData('last_country', currentCountry);
      }
    } catch (e) {
      debugPrint("Error getting location: $e");
      return {
        'status': false,
        'location': currentPosition,
        'current_country': currentCountry,
      };
    }
  }
}