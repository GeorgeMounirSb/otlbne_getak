part of 'sub_facility_info_cubit.dart';

@immutable
sealed class SubFacilityInfoState {}

final class SubFacilityInfoInitial extends SubFacilityInfoState {}

final class PickTime extends SubFacilityInfoState {}
final class ChangeDayHoliday extends SubFacilityInfoState {}
final class ChangeFacilityAvailability extends SubFacilityInfoState {}