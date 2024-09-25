import 'package:flutter/material.dart';
import 'package:food_app/features/home/presentation/views/widgets/selected_and_unselected_category_item.dart';
import 'package:food_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.isSelected,
  });

  final CategoryModel categoryModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? SelectedCategoryItem(categoryModel: categoryModel)
        : UnSelectedCategoryItem(categoryModel: categoryModel);
  }
}


// import 'package:flutter/material.dart';
// import 'package:food_app/features/home/domin/entities/category_entitie.dart';

// class CategoryItem extends StatelessWidget {
//   final CategoryEntitie categoryEntitie;
//   final bool isFilter;
//   final bool isSelected;
//   const CategoryItem({
//     super.key,
//     required this.categoryEntitie,
//     this.isFilter = false,
//     required this.isSelected,
//   });

//   Widget build(BuildContext context) {
//     return Container(
//         height: 44,
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//         decoration: ShapeDecoration(
//           color: isSelected
//               ? Color(0xffFFB01D)
//               : isFilter
//                   ? Colors.white
//                   : Color(0xffF7F7F7),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//             side: isFilter && !isSelected
//                 ? BorderSide(color: Color(0xffDCDCE4))
//                 : BorderSide.none,
//           ),
//         ),
//         child: Text(
//           categoryEntitie.name,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: isSelected
//                 ? Colors.white
//                 : isFilter
//                     ? Color(0xff8E8EA9)
//                     : Color(0xff666687),
//             fontSize: 16,
//             fontFamily: 'Mulish',
//             fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
//           ),
//         ));
//   }
// }
