import 'package:dartz/dartz.dart';
import 'package:food_app/core/errors/Failure.dart';
import 'package:food_app/features/order/data/data_source/order_remote_data_source.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';
import 'package:food_app/features/order/data/repos/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepoImpl({required this.orderRemoteDataSource});

  @override
  Future<Either<Failures, List<OrderModel>>> fetchOrders() async {
    List<OrderModel> orders = [];

    orders = await orderRemoteDataSource.fetchOrders();

    if (orders.isNotEmpty) {
      return right(orders);
    } else {
      return left(ServerFailure('No Orders Found'));
    }
  }
  
  @override
  Future<Either<Failures, void>> deleteOrder({required num orderId}) async{
    try {
  await orderRemoteDataSource.deleteOrder(orderId);
  
  return right(null);
}  catch (e) {
  return left(
    ServerFailure(
      e.toString(),
    ),
  );
}
  }
}
