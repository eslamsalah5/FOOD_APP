import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/service_locator.dart';
import 'package:food_app/core/widgets/my_button.dart';
import 'package:food_app/core/widgets/nav_to.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';
import 'package:food_app/features/order/data/repos/order_repo_impl.dart';
import 'package:food_app/features/order/data/repos/payment_repo_impl.dart';
import 'package:food_app/features/order/presentation/mangers/order_cubit/order_cubit.dart';
import 'package:food_app/features/order/presentation/mangers/payment_cubit/payment_cubit.dart';
import 'package:food_app/features/order/presentation/views/widgets/custom_app_bar.dart';
import 'package:food_app/features/order/presentation/views/widgets/order_item_list_view_bloc_provider.dart';
import 'package:food_app/features/order/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:food_app/features/order/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:food_app/features/thank_you/presentation/views/thank_you_view.dart';
import 'package:food_app/shared/widgets/widget.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(
        getIt.get<OrderRepoImpl>(),
      )..fetchOrders(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 24.0, vertical: 16),
          child: SafeArea(
            child: Column(
              children: [
                CustomAppBar(),
                SizedBox(
                  height: 24,
                ),
                OrderItemListViewBlocProvider(),
                SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Color(0xffFFB01D),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Add more food to order',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFB01D),
                        fontSize: 16,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    if (state is OrderSuccess) {
                      List<OrderModel> orders = state.orders;

                      // Calculate total price
                      double totalPrice = orders.fold(
                          0,
                          (previousValue, order) =>
                              previousValue + order.total);

                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({'totalPrice': totalPrice});
                      return Text(
                        'Total : ${totalPrice.toStringAsFixed(2)}', // يمكنك تنسيق العرض حسب الحاجة هنا
                        style: TextStyle(
                          color: Color(0xFF1D1E2C),
                          fontSize: 16,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                    return Text(
                      'Total : ',
                      style: TextStyle(
                        color: Color(0xFF1D1E2C),
                        fontSize: 16,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                myButton(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        builder: (context) {
                          return BlocProvider(
                            create: (context) =>
                                PaymentCubit(PaymentRepoImpl()),
                            child: const PaymentMethodsBottomSheet(),
                          );
                        });
                  },
                  text: 'Continue payment',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
