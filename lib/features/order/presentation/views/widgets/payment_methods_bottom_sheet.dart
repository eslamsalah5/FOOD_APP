import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/widgets/nav_to.dart';
import 'package:food_app/features/order/data/models/payment_intent_input_model.dart';
import 'package:food_app/features/order/presentation/mangers/payment_cubit/payment_cubit.dart';
import 'package:food_app/features/order/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:food_app/features/thank_you/presentation/views/thank_you_view.dart';
import 'package:food_app/features/thank_you/presentation/views/widgets/total_price_widget.dart';
import 'package:food_app/shared/widgets/widget.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

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
          PaymentMethodsListView(),
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
                    PaymentIntentInputModel paymentIntentInputModel =
                        PaymentIntentInputModel(
                      amount: '$totalAmountInCents',
                      currency: 'USD',
                      customerId: 'cus_Qh6vRVjmRDqzQD',
                    );
                    BlocProvider.of<PaymentCubit>(context).makePayment(
                      paymentIntentInputModel: paymentIntentInputModel,
                    );
                  },
                  isLoading: state is PaymentLoading ? true : false,
                  text: 'Continue');
            },
          ),
        ],
      ),
    );
  }
}
