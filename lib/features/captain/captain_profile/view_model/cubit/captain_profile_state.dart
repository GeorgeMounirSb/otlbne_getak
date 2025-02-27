part of 'captain_profile_cubit.dart';

@immutable
sealed class CaptainProfileState {}

final class CaptainProfileInitial extends CaptainProfileState {}

final class CaptainToggleStatus extends CaptainProfileState {}

final class CaptainProfileLoading extends CaptainProfileState {}
final class CaptainProfileLoaded extends CaptainProfileState {}