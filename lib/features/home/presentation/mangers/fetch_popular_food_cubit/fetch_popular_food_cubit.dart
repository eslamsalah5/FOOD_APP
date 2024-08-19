import 'package:bloc/bloc.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/domin/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_popular_food_state.dart';

class FetchPopularFoodCubit extends Cubit<FetchPopularFoodState> {
  FetchPopularFoodCubit(this.homeRepo) : super(FetchPopularFoodInitial());

  final HomeRepo homeRepo;

  Future<void> fetchPopularFood() async {
    emit(FetchPopularFoodLoading());

    final popularFood = await homeRepo.fetchPopularFood();
    popularFood.fold((failure) {
      emit(FetchPopularFoodError(failure.errorMessage));
    }, (FoodList) {
      emit(FetchPopularFoodSuccess(FoodList));
    });
  }
}
