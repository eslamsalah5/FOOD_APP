part of 'fetch_popular_food_cubit.dart';

@immutable
sealed class FetchPopularFoodState {}

final class FetchPopularFoodInitial extends FetchPopularFoodState {}

class FetchPopularFoodLoading extends FetchPopularFoodState {}

class FetchPopularFoodSuccess extends FetchPopularFoodState {
  final List<FoodEntitie> foodList;
  FetchPopularFoodSuccess(this.foodList);
}

class FetchPopularFoodError extends FetchPopularFoodState {
  final String message;
  FetchPopularFoodError(this.message);
}
