import 'package:bloc/bloc.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';
import 'package:food_app/features/order/data/repos/order_repo.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());

  final OrderRepo orderRepo;

 late List<OrderModel> ordersList = [];

  Future<void> fetchOrders() async {
    emit(OrderLoading());
    final orders = await orderRepo.fetchOrders();
    orders.fold((failure) {
      emit(OrderError(message: failure.errorMessage));
    }, (orders) {
      ordersList = orders;
      emit(OrderSuccess(orders: orders));
    });
  }

  Future<void> deleteOrder({required num orderId}) async {
    emit(DeleteOrderLoading());
    final orders = await orderRepo.deleteOrder(orderId: orderId);
    orders.fold((failure) {
      emit(DeleteOrderError(message: failure.errorMessage));
    }, (orders) {
      emit(DeleteOrderSuccess());
      fetchOrders();
    });
  }

  Future<void> decreaseOrderQuantity({required OrderModel orderModel}) async {
    emit(DecreaseOrderQuantityLoading());
    final orders = await orderRepo.decreaseOrderQuantity(orderModel: orderModel);
    orders.fold((failure) {
      emit(DecreaseOrderQuantityError(message: failure.errorMessage));
    }, (orders) {
      emit(DecreaseOrderQuantitySuccess());
      fetchOrders();
    });
  }

  Future<void> increaseOrderQuantity({required OrderModel orderModel}) async {
    emit(IncreaseOrderQuantityLoading());
    final orders = await orderRepo.increaseOrderQuantity(orderModel: orderModel);
    orders.fold((failure) {
      emit(IncreaseOrderQuantityError(message: failure.errorMessage));
    }, (orders) {
      emit(IncreaseOrderQuantitySuccess());
      fetchOrders();
    });
  }
}

