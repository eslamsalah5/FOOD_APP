import 'package:dartz/dartz.dart';
import 'package:food_app/core/errors/Failure.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';

abstract class OrderRepo {
  Future<Either<Failures, List<OrderModel>>> fetchOrders();

  Future<Either<Failures, void>> deleteOrder({required num orderId});

  Future<Either<Failures, void>> decreaseOrderQuantity({required OrderModel orderModel});

  Future<Either<Failures, void>> increaseOrderQuantity({required OrderModel orderModel});
}
