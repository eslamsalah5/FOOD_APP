part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderSuccess extends OrderState {
  final List<OrderModel> orders;

  OrderSuccess({required this.orders});
}

final class OrderError extends OrderState {
  final String message;

  OrderError({required this.message});
}

final class DeleteOrderLoading extends OrderState {}

final class DeleteOrderSuccess extends OrderState {}

final class DeleteOrderError extends OrderState {
  final String message;

  DeleteOrderError({required this.message});
}