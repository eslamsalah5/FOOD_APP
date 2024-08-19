part of 'fetch_beef_food_cubit.dart';

@immutable
sealed class FetchBeefFoodState {}

final class FetchBeefFoodInitial extends FetchBeefFoodState {}

final class FetchBeefFoodLoading extends FetchBeefFoodState {}

final class FetchBeefFoodSuccess extends FetchBeefFoodState {
  final List<FoodEntitie> foodList;
  FetchBeefFoodSuccess(this.foodList);
}

final class FetchBeefFoodError extends FetchBeefFoodState {
  final String error;
  FetchBeefFoodError(this.error);
}
