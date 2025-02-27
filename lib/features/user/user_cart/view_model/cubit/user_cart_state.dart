part of 'user_cart_cubit.dart';

@immutable
sealed class UserCartState {}

final class UserCartInitial extends UserCartState {}

final class SetOrderTypes extends UserCartState {}
final class SelectHomeType extends UserCartState {}
final class SelectCount extends UserCartState {}
final class SelectFilter extends UserCartState {}
final class ChangeProductQty extends UserCartState {}
