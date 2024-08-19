import 'package:dartz/dartz.dart';
import 'package:food_app/core/errors/Failure.dart';
import 'package:food_app/features/order/data/models/payment_intent_input_model.dart';

abstract class PaymentRepo {
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
