part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<FoodEntitie> searchedFood;
  SearchSuccess({required this.searchedFood});
}

final class SearchFailure extends SearchState {
  final String message;
  SearchFailure({required this.message});
}

final class SearchLoading extends SearchState {}

final class SearchEmpty extends SearchState {}
