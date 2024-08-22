import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:food_app/core/utils/keys.dart';
import 'package:food_app/core/widgets/nav_to.dart';
import 'package:food_app/features/order/data/models/orders_model.dart';
import 'package:food_app/features/order/data/models/payment_intent_input_model.dart';
import 'package:food_app/features/order/presentation/mangers/order_cubit/order_cubit.dart';
import 'package:food_app/features/order/presentation/mangers/payment_cubit/payment_cubit.dart';
import 'package:food_app/features/order/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:food_app/features/thank_you/presentation/views/thank_you_view.dart';
import 'package:food_app/features/thank_you/presentation/views/widgets/total_price_widget.dart';
import 'package:food_app/shared/widgets/widget.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;
  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(
            updatePaymentMethod: updatePaymentMethod,
          ),
          SizedBox(
            height: 32,
          ),
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentSuccess) {
                navTo(context, ThankYouView());
              } else if (state is PaymentFailure) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
                log(state.message);
              }
            },
            builder: (context, state) {
              return CustomButton(
                  onPressed: () async {
                    num totalPrice = await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .get()
                        .then((value) {
                      return value.data()!['totalPrice'];
                    });

                    // تحويل السعر إلى سنت (مثلاً إذا كان بعملة USD)
                    int totalAmountInCents = (totalPrice).toInt();

                    if (isPaypal) {
                      var orders =
                          BlocProvider.of<OrderCubit>(context).ordersList;
                      List<Map<String, dynamic>> items = [
                        for (var order in orders)
                          {
                            "name": order.name,
                            "quantity": order.quantity,
                            "price": order.price,
                            "currency": "USD",
                          }
                      ];
                      paypalPayment(context, totalAmountInCents, items);
                    } else {
                      stripePayment(totalAmountInCents, context);
                    }
                  },
                  isLoading: state is PaymentLoading ? true : false,
                  text: 'Continue');
            },
          ),
        ],
      ),
    );
  }

  void stripePayment(int totalAmountInCents, BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '$totalAmountInCents',
      currency: 'USD',
      customerId: 'cus_Qh6vRVjmRDqzQD',
    );
    BlocProvider.of<PaymentCubit>(context).makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
  }

  void paypalPayment(BuildContext context, int totalAmountInCents,
      List<Map<String, dynamic>> items) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: Keys.clientId,
          secretKey: Keys.secretKeyPaypal,
          transactions: [
            {
              "amount": {
                "total": '$totalAmountInCents',
                "currency": "USD",
                "details": {
                  "subtotal": '$totalAmountInCents',
                  "shipping": '0',
                  "shipping_discount": 0
                }
              },
              "description": "The payment transaction description.",
              // "payment_options": {
              //   "allowed_payment_method":
              //       "INSTANT_FUNDING_SOURCE"
              // },
              "item_list": {
                "items": items,
              }
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
