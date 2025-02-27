part of 'facility_cubit.dart';

@immutable
sealed class FacilityState {}

final class FacilityInitial extends FacilityState {}

final class FacilityProductsFiltered extends FacilityState {}
final class FacilityProductAddedFromCart extends FacilityState {}