import 'package:bloc/bloc.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';
import 'package:food_app/features/order/data/repos/order_repo.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());

  final OrderRepo orderRepo;

  Future<void> fetchOrders() async {
    emit(OrderLoading());
    final orders = await orderRepo.fetchOrders();
    orders.fold((failure) {
      emit(OrderError(message: failure.errorMessage));
    }, (orders) {
      emit(OrderSuccess(orders: orders));
    });
  }
}
