part of 'captain_home_cubit.dart';

@immutable
sealed class CaptainHomeState {}

final class CaptainHomeCubitInitial extends CaptainHomeState {}

final class AvailableForWork extends CaptainHomeState {}
final class AvailableOrders extends CaptainHomeState {}
final class RefuseOrder extends CaptainHomeState {}
final class CaptainHomeCubitLoaded extends CaptainHomeState {}
final class CaptainHomeCubitLoading extends CaptainHomeState {}