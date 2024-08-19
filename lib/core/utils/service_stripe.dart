import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_app/core/utils/dio_helper.dart';
import 'package:food_app/core/utils/keys.dart';
import 'package:food_app/features/order/data/models/payment_intent_input_model.dart';
import 'package:food_app/features/order/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:food_app/features/order/presentation/mangers/payment_cubit/payment_cubit.dart';

class StripeService {
  final DioHelper dioHelper = DioHelper(Dio());

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await dioHelper.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      data: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      token: Keys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "eslam",
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    PaymentIntentModel paymentIntentModel = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
