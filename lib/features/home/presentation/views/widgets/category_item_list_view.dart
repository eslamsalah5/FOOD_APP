import 'package:flutter/material.dart';
import 'package:food_app/features/home/data/models/food_model/category.dart';
import 'package:food_app/features/home/domin/entities/category_entitie.dart';
import 'package:food_app/features/home/presentation/views/widgets/category_item.dart';

class CategoryItemListView extends StatefulWidget {
  final List<CategoryEntitie> categories;

  const CategoryItemListView({
    super.key,
    required this.categories,
  });

  @override
  State<CategoryItemListView> createState() => _CategoryItemListViewState();
}

class _CategoryItemListViewState extends State<CategoryItemListView> {
  int selectedIndex = 0;

  @override
  initState() {
    widget.categories.insert(
        0,
        Category(
          id: 0,
          category: 'All Dishes',
          thumbnail: 'assets/images/all.png',
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: CategoryItem(
            categoryEntitie: widget.categories[index],
            isSelected: selectedIndex == index,
          ),
        ),
        itemCount: widget.categories.length,
      ),
    );
  }
}
