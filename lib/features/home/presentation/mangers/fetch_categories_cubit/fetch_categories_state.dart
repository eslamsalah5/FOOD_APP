part of 'fetch_categories_cubit.dart';

@immutable
sealed class FetchCategoriesState {}

final class FetchCategoriesInitial extends FetchCategoriesState {}

final class FetchCategoriesLoading extends FetchCategoriesState {}

final class FetchCategoriesSuccess extends FetchCategoriesState {
  final List<CategoryEntitie> categories;
  FetchCategoriesSuccess(this.categories);
}

final class FetchCategoriesError extends FetchCategoriesState {
  final String message;
  FetchCategoriesError(this.message);
}
