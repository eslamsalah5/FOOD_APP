import 'package:hive/hive.dart';

part 'category_entitie.g.dart';

@HiveType(typeId: 0)
class CategoryEntitie extends HiveObject {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int categoryId;
  CategoryEntitie({
    required this.categoryId,
    required this.image,
    required this.name,
  });
}
