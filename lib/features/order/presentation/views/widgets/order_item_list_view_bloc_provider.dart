import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/service_locator.dart';
import 'package:food_app/features/order/data/repos/order_repo_impl.dart';
import 'package:food_app/features/order/presentation/mangers/order_cubit/order_cubit.dart';
import 'package:food_app/features/order/presentation/views/widgets/order_item_list_view.dart';

class OrderItemListViewBlocProvider extends StatelessWidget {
  const OrderItemListViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderSuccess) {
          return OrderItemListView(order: state.orders);
        } else if (state is OrderError) {
          return Text(state.message);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
