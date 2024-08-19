import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/features/home/domin/entities/category_entitie.dart';
import 'package:food_app/features/home/domin/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_categories_state.dart';

class FetchCategoriesCubit extends Cubit<FetchCategoriesState> {
  FetchCategoriesCubit(this.homeRepo) : super(FetchCategoriesInitial());

  final HomeRepo homeRepo;
  Future<void> fetchCategories() async {
    emit(FetchCategoriesLoading());
    final Categories = await homeRepo.fetchCategories();
    Categories.fold((failure) {
      emit(FetchCategoriesError(failure.errorMessage));
    }, (CategoriesList) {
      // print(FirebaseAuth.instance.currentUser!.uid);
      emit(FetchCategoriesSuccess(CategoriesList));
    });
  }
}
