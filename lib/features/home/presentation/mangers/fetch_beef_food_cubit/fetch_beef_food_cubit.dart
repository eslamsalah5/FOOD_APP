import 'package:bloc/bloc.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/domin/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_beef_food_state.dart';

class FetchBeefFoodCubit extends Cubit<FetchBeefFoodState> {
  FetchBeefFoodCubit(this.homeRepo) : super(FetchBeefFoodInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBeefFood() async {
    emit(FetchBeefFoodLoading());
    final result = await homeRepo.fetchBeefFood();
    result.fold(
      (failure) => emit(FetchBeefFoodError(failure.errorMessage)),
      (FoodList) => emit(FetchBeefFoodSuccess(FoodList)),
    );
  }
}
