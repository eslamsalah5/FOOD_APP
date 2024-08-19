import 'package:bloc/bloc.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/domin/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_appetizer_food_state.dart';

class FetchAppetizerFoodCubit extends Cubit<FetchAppetizerFoodState> {
  FetchAppetizerFoodCubit(this.homeRepo) : super(FetchAppetizerFoodInitial());

  final HomeRepo homeRepo;

  Future<void> fetchAppetizerFood() async {
    emit(FetchAppetizerFoodLoading());
    final appetizerFood = await homeRepo.fetchAppetizerFood();

    appetizerFood.fold((failure) {
      emit(FetchAppetizerFoodError(failure.errorMessage));
    }, (FoodList) {
      emit(FetchAppetizerFoodSuccess(FoodList));
    });
  }
}
