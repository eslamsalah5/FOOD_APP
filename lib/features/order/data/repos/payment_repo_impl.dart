import 'package:dartz/dartz.dart';
import 'package:food_app/core/errors/Failure.dart';
import 'package:food_app/core/utils/service_stripe.dart';
import 'package:food_app/features/order/data/models/payment_intent_input_model.dart';
import 'package:food_app/features/order/data/repos/payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
