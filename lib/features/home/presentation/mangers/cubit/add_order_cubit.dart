import 'package:bloc/bloc.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/domin/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(
    this.homeRepo,
  ) : super(AddOrderInitial());
  final HomeRepo homeRepo;

  Future<void> addOrder(FoodEntitie foodEntitie) async {
    emit(AddOrderLoading());
    try {
      await homeRepo.AddOrder(foodEntitie);
      emit(AddOrderSuccess(foodEntitie));
    } catch (e) {
      emit(AddOrderError(e.toString()));
    }
  }
}
