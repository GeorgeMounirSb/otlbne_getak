import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

part 'captain_order_map_state.dart';

class CaptainOrderMapCubit extends Cubit<CaptainOrderMapCubitState> {
  CaptainOrderMapCubit() : super(CaptainOrderMapCubitInitial());

  static CaptainOrderMapCubit get(context) => BlocProvider.of(context);

  bool mapInitialized = false;
  late CameraPosition initialPosition;
  late GoogleMapController mapController;
  late LocationData currentPosition;
  late Location location;
  late LatLng designation;
  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};

  initializeMap(LatLng firstDesignation) async{
    designation = firstDesignation;
    LocationData startPosition = await getCurrentPosition();
    LatLng startDestination = LatLng(startPosition.latitude!, startPosition.longitude!);
    markers = setMarkers(firstDesignation);
    initialPosition = CameraPosition(target: firstDesignation, zoom: 17.0);
    List<LatLng> routePoints = await getRoute(startDestination, firstDesignation);
    polyLines.add(Polyline(
      polylineId: const PolylineId("route"),
      points: routePoints,
      color: Colors.blue,
      width: 5,
    ));
    locationListener();
    mapInitialized = true;
    emit(CaptainOrderMapCubitMapInitial());
  }
  Future<List<LatLng>> getRoute(LatLng start, LatLng end) async {
    String url ="https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=AIzaSyB2geV5kGRXGGZUJfm9NLSo_YZhauEVlvQ";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if ((data["routes"] as List).isNotEmpty) {
        List<PointLatLng> result = PolylinePoints().decodePolyline(data["routes"][0]["overview_polyline"]["points"]);
        return result.map((point) => LatLng(point.latitude, point.longitude)).toList();
      }
    }
    return [];
  }
  Future<LocationData> getCurrentPosition() async {
    location = Location();
    currentPosition = await location .getLocation();
    return currentPosition;
  }
  setMarkers(LatLng endDestination) {
    return {
      Marker(
        markerId: MarkerId(endDestination.latitude.toString()),
        position: endDestination,
      ),
    };
  }
  goToCurrentLocation() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(currentPosition.latitude!, currentPosition.longitude!), zoom: 19.0),
    ));
  }
  goToNewLocation(LatLng newLocation) {
    return mapController.animateCamera(
    CameraUpdate.newCameraPosition(
      CameraPosition(target: newLocation, zoom: 19.0),
    ));
  }
  updatePolyline(LatLng newLocation, LatLng destination) async {
    List<LatLng> updatedRoutePoints = await getRoute(newLocation, destination);
    polyLines.clear();
    polyLines.add(Polyline(
      polylineId: const PolylineId("route"),
      points: updatedRoutePoints,
      color: Colors.blue,
      width: 5,
    ));
    emit(CaptainOrderMapUpdatePolyLines());
  }
  locationListener() async {
    location.changeSettings(distanceFilter: 5);
    location.onLocationChanged.listen((locationData) {
      LatLng newLocation = LatLng(locationData.latitude!, locationData.longitude!);
      goToNewLocation(newLocation);
      updatePolyline(newLocation, designation);
    });
  }
  
  @override
  Future<void> close() async {
    location.onLocationChanged.drain();
    mapController.dispose();
    markers.clear();
    polyLines.clear();
    return super.close();
  }
}