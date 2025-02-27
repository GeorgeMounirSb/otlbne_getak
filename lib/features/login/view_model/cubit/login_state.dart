part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class TypeChanged extends LoginState {}

final class PasswordVisibilityChanged extends LoginState {}