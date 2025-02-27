part of 'user_cars_facilities_cubit.dart';

@immutable
sealed class UserCarsFacilitiesState {}

final class UserCarsFacilitiesInitial extends UserCarsFacilitiesState {}

final class TypeChanged extends UserCarsFacilitiesState {}
