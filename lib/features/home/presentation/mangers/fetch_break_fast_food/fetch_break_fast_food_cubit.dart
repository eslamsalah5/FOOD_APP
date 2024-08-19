import 'package:bloc/bloc.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/domin/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_break_fast_food_state.dart';

class FetchBreakFastFoodCubit extends Cubit<FetchBreakFastFoodState> {
  FetchBreakFastFoodCubit(this.homeRepo) : super(FetchBreakFastFoodInitial());
  final HomeRepo homeRepo;

  Future<void> fetchBreakFastFood() async {
    emit(FetchBreakFastFoodLoading());
    final breakFastFood = await homeRepo.fetchBreakFastFood();
    breakFastFood.fold((failure) {
      emit(FetchBreakFastFoodFailure(message: failure.errorMessage));
    }, (FoodList) {
      emit(
        FetchBreakFastFoodSuccess(
          foodList: FoodList,
        ),
      );
    });
  }
}
