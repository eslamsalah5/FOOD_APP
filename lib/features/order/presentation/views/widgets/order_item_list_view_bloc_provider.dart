import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/service_locator.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';
import 'package:food_app/features/order/data/repos/order_repo_impl.dart';
import 'package:food_app/features/order/presentation/mangers/order_cubit/order_cubit.dart';
import 'package:food_app/features/order/presentation/views/widgets/order_item_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderItemListViewBlocProvider extends StatelessWidget {
  const OrderItemListViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderSuccess) {
          return Skeletonizer(
            enabled: false,
            child: OrderItemListView(
              order: state.orders,
            ),
          );
        } else if (state is OrderError) {
          return Text(state.message);
        }
        return Skeletonizer(
          enabled: true,
          child: OrderItemListView(
            order: getDommyList(),
          ),
        );
      },
    );
  }

  List<OrderModel> getDommyList() {
    return [
      OrderModel(
          image:
              "https://img.freepik.com/free-photo/delicious-looking-3d-burger-with-simple-background_23-2150914809.jpg?t=st=1727264513~exp=1727268113~hmac=608ce2bfca3de18eeb959dacb209a4e7cd4c8e5b3d86021a29fceed8becaebb2&w=826",
          name: "djhasaddajsh  asjhsdja",
          price: 432,
          quantity: 2,
          rating: 5,
          total: 984,
          id: 1),
      OrderModel(
          image:
              "https://img.freepik.com/free-photo/delicious-looking-3d-burger-with-simple-background_23-2150914809.jpg?t=st=1727264513~exp=1727268113~hmac=608ce2bfca3de18eeb959dacb209a4e7cd4c8e5b3d86021a29fceed8becaebb2&w=826",
          name: "djhasaddajsh  asjhsdjakljhklsddfdgsadsfgdsdfgds",
          price: 432,
          quantity: 2,
          rating: 5,
          total: 984,
          id: 1),
      OrderModel(
          image:
              "https://img.freepik.com/free-photo/delicious-looking-3d-burger-with-simple-background_23-2150914809.jpg?t=st=1727264513~exp=1727268113~hmac=608ce2bfca3de18eeb959dacb209a4e7cd4c8e5b3d86021a29fceed8becaebb2&w=826",
          name: "djhasaddajsh  asjdskldnvlklsdnsdhsdja",
          price: 432,
          quantity: 2,
          rating: 5,
          total: 984,
          id: 1),
    ];
  }
}
