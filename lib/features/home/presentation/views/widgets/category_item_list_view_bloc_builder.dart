// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_app/core/utils/service_locator.dart';
// import 'package:food_app/features/home/data/repos/home_repo_impl.dart';
// import 'package:food_app/features/home/presentation/mangers/fetch_categories_cubit/fetch_categories_cubit.dart';
// import 'package:food_app/features/home/presentation/views/widgets/category_item_list_view.dart';

// class CategoryItemListViewBlocBuilder extends StatelessWidget {
//   const CategoryItemListViewBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FetchCategoriesCubit, FetchCategoriesState>(
//       builder: (context, state) {
//         if (state is FetchCategoriesSuccess) {
//           return CategoryItemListView(
//             categories: state.categories,
//           );
//         } else if (state is FetchCategoriesError) {
//           return Text(state.message);
//         }

//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
