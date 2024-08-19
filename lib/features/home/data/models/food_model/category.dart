import 'package:food_app/features/home/domin/entities/category_entitie.dart';

class Category extends CategoryEntitie {
  int? id;
  String? category;
  String? thumbnail;

  Category({this.id, this.category, this.thumbnail})
      : super(categoryId: id!, image: thumbnail ?? '', name: category!);

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        category: json['category'] as String?,
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'thumbnail': thumbnail,
      };
}
