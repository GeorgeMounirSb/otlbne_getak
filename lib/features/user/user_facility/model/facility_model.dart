import 'package:otlbne_getak/features/user/search/model/search_model.dart';

class FacilityModel {
  final String id, title, img;
  final List<SearchModel> facilityProducts;

  FacilityModel({required this.id, required this.title, required this.img, required this.facilityProducts});
}