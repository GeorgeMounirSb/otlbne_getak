part of 'sub_facility_orders_cubit.dart';

@immutable
sealed class SubFacilityOrdersState {}

final class SubFacilityOrdersInitial extends SubFacilityOrdersState {}


final class FilterFacilityOrders extends SubFacilityOrdersState {}
final class ChangeFilters extends SubFacilityOrdersState {}
