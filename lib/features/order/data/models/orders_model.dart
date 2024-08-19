class OrderModel {
  final String image;
  final String name;
  final num price;
  final num quantity;
  final num rating;
  final num total;

  const OrderModel({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      image: json['image'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      rating: json['rating'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['rating'] = this.rating;
    data['total'] = this.total;
    return data;
  }
}
