part of 'sub_facility_financial_cubit.dart';

@immutable
sealed class SubFacilityFinancialState {}

final class SubFacilityFinancialInitial extends SubFacilityFinancialState {}

final class GetFinancialData extends SubFacilityFinancialState {}
final class FilterFinancialData extends SubFacilityFinancialState {}