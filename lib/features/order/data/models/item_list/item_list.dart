import 'package:food_app/features/order/data/models/orders_model.dart';

import 'item.dart';

class ItemList {
  List<OrderModel>? orders;

  ItemList({this.orders});

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
        orders: json['items'] != null
            ? (json['items'] as List)
                .map((i) => OrderModel.fromJson(i))
                .toList()
            : null,
      );

  Map<String, dynamic> toJson() => {
        'items': orders?.map((e) => e.toJson()).toList(),
      };
}
