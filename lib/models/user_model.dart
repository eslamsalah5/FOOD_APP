class UserModel {
  final String? userName;
  final String? email;
  final String? phone;
  final String? uId;
  final bool? isEmailVerified;
  final num? totalPrice;

  UserModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.uId,
    this.isEmailVerified = false,
    this.totalPrice = 0,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'],
      email: map['email'],
      phone: map['phone'],
      uId: map['uId'],
      isEmailVerified: map['isEmailVerified'],
      totalPrice: map['totalPrice'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      'totalPrice': totalPrice,
    };
  }
}
