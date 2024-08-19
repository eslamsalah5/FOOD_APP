import 'package:bloc/bloc.dart';
import 'package:food_app/features/order/data/models/payment_intent_input_model.dart';
import 'package:food_app/features/order/data/repos/payment_repo.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepo) : super(PaymentInitial());

  final PaymentRepo paymentRepo;

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    final payment = await paymentRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    payment.fold((failure) {
      emit(PaymentFailure(failure.errorMessage));
    }, (r) {
      emit(PaymentSuccess());
    });
  }
}
