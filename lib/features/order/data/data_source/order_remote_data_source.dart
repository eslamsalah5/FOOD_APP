import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> fetchOrders();
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
}
