part of 'fetch_appetizer_food_cubit.dart';

@immutable
sealed class FetchAppetizerFoodState {}

final class FetchAppetizerFoodInitial extends FetchAppetizerFoodState {}

class FetchAppetizerFoodLoading extends FetchAppetizerFoodState {}

class FetchAppetizerFoodSuccess extends FetchAppetizerFoodState {
  final List<FoodEntitie> foodList;
  FetchAppetizerFoodSuccess(this.foodList);
}

class FetchAppetizerFoodError extends FetchAppetizerFoodState {
  final String message;
  FetchAppetizerFoodError(this.message);
}
