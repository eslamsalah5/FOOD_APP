import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> fetchOrders();
  Future<void> deleteOrder(num orderId);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  @override
  Future<List<OrderModel>> fetchOrders() async {
    List<OrderModel> orders = [];

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('orders')
        .get()
        .then((value) {
      orders = value.docs.map((e) => OrderModel.fromJson(e.data())).toList();
    });
    return orders;
  }

  @override
  Future<void> deleteOrder(num orderId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('orders')
        .doc(orderId.toString())
        .delete();
  }
}
