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

final class DecreaseOrderQuantityLoading extends OrderState {}

final class DecreaseOrderQuantitySuccess extends OrderState {}

final class DecreaseOrderQuantityError extends OrderState {
  final String message;

  DecreaseOrderQuantityError({required this.message});
}

final class IncreaseOrderQuantityLoading extends OrderState {}

final class IncreaseOrderQuantitySuccess extends OrderState {}

final class IncreaseOrderQuantityError extends OrderState {
  final String message;

  IncreaseOrderQuantityError({required this.message});
}