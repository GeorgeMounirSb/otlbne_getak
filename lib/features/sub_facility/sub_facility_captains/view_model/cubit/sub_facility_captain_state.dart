part of 'sub_facility_captain_cubit.dart';

@immutable
sealed class SubFacilityCaptainState {}

final class SubFacilityCaptainInitial extends SubFacilityCaptainState {}

final class GetCaptainsData extends SubFacilityCaptainState {}
final class FilterOrders extends SubFacilityCaptainState {}
final class ChangeStatusFilter extends SubFacilityCaptainState {}
