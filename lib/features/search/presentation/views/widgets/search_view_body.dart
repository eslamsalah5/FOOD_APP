import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/service_locator.dart';
import 'package:food_app/core/widgets/my_text_form_field.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_bottom_sheet/food_bottom_sheet.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_gird.dart';
import 'package:food_app/features/search/data/repos/search_repo_impl.dart';
import 'package:food_app/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:food_app/features/search/presentation/views/widgets/search_food_list_view.dart';
import 'package:food_app/features/search/presentation/views/widgets/search_food_list_view_bloc_builder.dart';
import 'package:food_app/features/search/presentation/views/widgets/search_text_form_field.dart';
import 'package:food_app/models/add_topping_model.dart';
import 'package:food_app/models/recommended_side_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    searchController.text = "";
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final List<FoodEntitie> foodList = [
    FoodEntitie(
        foodImage:
            "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Beef_And_Egg_Early_Morning_Muffin-Beef_And_Egg_Early_Morning_Muffin.jpg",
        name: "Beef And Egg Early Morning Muffin",
        price: 207.0,
        Rating: 4.5,
        ingredients: ["dd"],
        kCal: 20.0,
        grams: 20.0,
        description: "dd",
        proteins: 20.0,
        fats: 4,
        carbs: 5,
        number: 2,
        foodId: 234),
    FoodEntitie(
        foodImage:
            "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Awesome_Asian_Beef_Steak-Awesome_Asian_Beef_Steak.jpg",
        name: "Awesome Asian Beef Steak",
        price: 20.0,
        Rating: 4.5,
        ingredients: ["dd"],
        kCal: 20.0,
        grams: 20.0,
        description: "dd",
        proteins: 20.0,
        fats: 4,
        carbs: 5,
        number: 2,
        foodId: 234),
    FoodEntitie(
        foodImage:
            "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Beef_And_Egg_Early_Morning_Muffin-Beef_And_Egg_Early_Morning_Muffin.jpg",
        name: "Beef And Egg Early Morning Muffin",
        price: 207.0,
        Rating: 4.5,
        ingredients: ["dd"],
        kCal: 20.0,
        grams: 20.0,
        description: "dd",
        proteins: 20.0,
        fats: 4,
        carbs: 5,
        number: 2,
        foodId: 234),
    FoodEntitie(
        foodImage:
            "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Awesome_Asian_Beef_Steak-Awesome_Asian_Beef_Steak.jpg",
        name: "Awesome Asian Beef Steak",
        price: 20.0,
        Rating: 4.5,
        ingredients: ["dd"],
        kCal: 20.0,
        grams: 20.0,
        description: "dd",
        proteins: 20.0,
        fats: 4,
        carbs: 5,
        number: 2,
        foodId: 234),
    FoodEntitie(
        foodImage:
            "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Awesome_Asian_Beef_Steak-Awesome_Asian_Beef_Steak.jpg",
        name: "Awesome Asian Beef Steak",
        price: 20.0,
        Rating: 4.5,
        ingredients: ["dd"],
        kCal: 20.0,
        grams: 20.0,
        description: "dd",
        proteins: 20.0,
        fats: 4,
        carbs: 5,
        number: 2,
        foodId: 234),
    FoodEntitie(
        foodImage:
            "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Beef_And_Egg_Early_Morning_Muffin-Beef_And_Egg_Early_Morning_Muffin.jpg",
        name: "Beef And Egg Early Morning Muffin",
        price: 207.0,
        Rating: 4.5,
        ingredients: ["dd"],
        kCal: 20.0,
        grams: 20.0,
        description: "dd",
        proteins: 20.0,
        fats: 4,
        carbs: 5,
        number: 2,
        foodId: 234),
    FoodEntitie(
        foodImage:
            "https://s3.us-west-004.backblazeb2.com/encurate/static/keto/1/Awesome_Asian_Beef_Steak-Awesome_Asian_Beef_Steak.jpg",
        name: "Awesome Asian Beef Steak",
        price: 20.0,
        Rating: 4.5,
        ingredients: ["dd"],
        kCal: 20.0,
        grams: 20.0,
        description: "dd",
        proteins: 20.0,
        fats: 4,
        carbs: 5,
        number: 2,
        foodId: 234),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        getIt.get<SearchRepoImpl>(),
      )..fetchSearchedFood(searchWord: searchController.text),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: SearchTextFormField(searchController: searchController)),
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            SliverToBoxAdapter(
                child: SearchFoodListViewBlocBuilder(foodList: foodList)),
          ],
        ),
      ),
    );
  }
}
