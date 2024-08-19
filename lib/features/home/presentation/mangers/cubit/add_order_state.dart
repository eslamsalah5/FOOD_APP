part of 'add_order_cubit.dart';

@immutable
sealed class AddOrderState {}

final class AddOrderInitial extends AddOrderState {}

final class AddOrderLoading extends AddOrderState {}

final class AddOrderSuccess extends AddOrderState {
  final FoodEntitie foodEntitie;

  AddOrderSuccess(this.foodEntitie);
}

final class AddOrderError extends AddOrderState {
  final String message;
  AddOrderError(this.message);
}
