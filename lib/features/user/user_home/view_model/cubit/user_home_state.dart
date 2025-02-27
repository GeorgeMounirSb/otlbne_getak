part of 'user_home_cubit.dart';

@immutable
sealed class UserHomeState {}

final class UserHomeInitial extends UserHomeState {}

final class UserHomeFiltered extends UserHomeState {}

final class LocationEnabled extends UserHomeState {}
final class LocationDisabled extends UserHomeState {}