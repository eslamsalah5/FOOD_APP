import 'package:dartz/dartz.dart';
import 'package:food_app/core/errors/Failure.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';

abstract class OrderRepo {
  Future<Either<Failures, List<OrderModel>>> fetchOrders();
}
