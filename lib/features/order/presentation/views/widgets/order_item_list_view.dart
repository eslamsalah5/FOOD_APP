import 'package:flutter/material.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';
import 'package:food_app/features/order/presentation/views/widgets/order_item.dart';

class OrderItemListView extends StatelessWidget {
  final List<OrderModel> order;
  const OrderItemListView({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => OrderItem(
        order: order[index],
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
      itemCount: order.length,
    );
  }
}
