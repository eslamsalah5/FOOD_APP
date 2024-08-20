
class InitPaymentInputModel {
  final String paymentIntentClientSecret;
  final String customerId;
  final String ephemeralKey;
  InitPaymentInputModel({
    required this.paymentIntentClientSecret,
    required this.customerId,
    required this.ephemeralKey,
  });

  Map<String, dynamic> toJson() => {
        'paymentIntentClientSecret': paymentIntentClientSecret,
        'customer': customerId,
        'ephemeralKey': ephemeralKey,
      };
}
