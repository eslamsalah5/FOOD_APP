part of 'fetch_break_fast_food_cubit.dart';

@immutable
sealed class FetchBreakFastFoodState {}

final class FetchBreakFastFoodInitial extends FetchBreakFastFoodState {}

final class FetchBreakFastFoodLoading extends FetchBreakFastFoodState {}

final class FetchBreakFastFoodSuccess extends FetchBreakFastFoodState {
  final List<FoodEntitie> foodList;
  FetchBreakFastFoodSuccess({required this.foodList});
}

final class FetchBreakFastFoodFailure extends FetchBreakFastFoodState {
  final String message;
  FetchBreakFastFoodFailure({required this.message});
}
