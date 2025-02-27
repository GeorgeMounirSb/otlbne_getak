part of 'user_medical_facility_cubit.dart';

@immutable
sealed class UserMedicalFacilityState {}

final class UserMedicalFacilityInitial extends UserMedicalFacilityState {}

final class MedicalTypeSelected extends UserMedicalFacilityState {}
