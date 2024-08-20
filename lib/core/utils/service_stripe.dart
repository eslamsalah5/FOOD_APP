import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_app/core/utils/dio_helper.dart';
import 'package:food_app/core/utils/keys.dart';
import 'package:food_app/features/order/data/models/init_payment_input_model.dart';
import 'package:food_app/features/order/data/models/key_ephemeral_model/key_ephemeral_model.dart';
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

  Future<KeyEphemeralModel> createEphemeralKey(String? customerId) async {
    var response = await dioHelper.post(
        data: {'customer': customerId},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': 'Bearer ${Keys.secretKey}',
          'Stripe-Version': '2024-06-20',
        });
    var keyEphemeralModel = KeyEphemeralModel.fromJson(response.data);

    return keyEphemeralModel;
  }

  Future<void> initPaymentSheet(
      {required InitPaymentInputModel initPaymentInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            initPaymentInputModel.paymentIntentClientSecret,
        customerId: initPaymentInputModel.customerId,
        customerEphemeralKeySecret: initPaymentInputModel.ephemeralKey,
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
    KeyEphemeralModel keyEphemeralModel =
        await createEphemeralKey('cus_Qh6vRVjmRDqzQD');
    InitPaymentInputModel initPaymentInputModel = InitPaymentInputModel(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      customerId: 'cus_Qh6vRVjmRDqzQD',
      ephemeralKey: keyEphemeralModel.secret!,
    );
    await initPaymentSheet(initPaymentInputModel: initPaymentInputModel);
    await displayPaymentSheet();
  }
}
