part of 'captain_order_map_cubit.dart';

@immutable
sealed class CaptainOrderMapCubitState {}

final class CaptainOrderMapCubitInitial extends CaptainOrderMapCubitState {}

final class CaptainOrderMapCubitMapInitial extends CaptainOrderMapCubitState {}
final class CaptainOrderMapUpdatePolyLines extends CaptainOrderMapCubitState {}