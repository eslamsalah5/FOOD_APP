import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_appetizer_food_cubit/fetch_appetizer_food_cubit.dart';
import 'package:food_app/features/home/presentation/views/widgets/foods_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppetizerFoodListViewBlocBuilder extends StatelessWidget {
  const AppetizerFoodListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAppetizerFoodCubit, FetchAppetizerFoodState>(
      builder: (context, state) {
        if (state is FetchAppetizerFoodSuccess) {
          return Skeletonizer(
            enabled: false,
            child: FoodsListView(
              foodList: state.foodList,
            ),
          );
        } else if (state is FetchAppetizerFoodError) {
          return Text(state.message);
        }

        return Skeletonizer(
          enabled: true,
          child: FoodsListView(
            foodList: getDommyList(),
          ),
        );
      },
    );
  }

  List<FoodEntitie> getDommyList() {
    return [
      FoodEntitie(
          foodImage:
              "https://img.freepik.com/free-photo/delicious-looking-3d-burger-with-simple-background_23-2150914809.jpg?t=st=1727264513~exp=1727268113~hmac=608ce2bfca3de18eeb959dacb209a4e7cd4c8e5b3d86021a29fceed8becaebb2&w=826",
          name: "djhasaddajsh  asjhsdja",
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
              "https://img.freepik.com/free-photo/delicious-looking-3d-burger-with-simple-background_23-2150914809.jpg?t=st=1727264513~exp=1727268113~hmac=608ce2bfca3de18eeb959dacb209a4e7cd4c8e5b3d86021a29fceed8becaebb2&w=826",
          name: "ddklsdfkljkklsajdhklasjdkjshdklasdjdsjhkjkasdljdsjk",
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
              "https://img.freepik.com/free-photo/delicious-looking-3d-burger-with-simple-background_23-2150914809.jpg?t=st=1727264513~exp=1727268113~hmac=608ce2bfca3de18eeb959dacb209a4e7cd4c8e5b3d86021a29fceed8becaebb2&w=826",
          name: "ddasklfnaslfnkaslnlasnflasnl",
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
  }
}
