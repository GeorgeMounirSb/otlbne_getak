import 'package:flutter/material.dart';

class SubFacilityDaysModel {
  final String day;
  TimeOfDay startTime, endTime;
  bool isHoliday;

  SubFacilityDaysModel({required this.day, required this.startTime, required this.endTime, required this.isHoliday});
}