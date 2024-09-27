import 'package:bloc/bloc.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedFood({required String searchWord}) async {
    emit(SearchLoading());
    if (searchWord.isEmpty) {
      emit(SearchEmpty());
    }
    final food = await searchRepo.fetchSearchedFood(searchWord: searchWord);
    food.fold(
      (errorMessage) => emit(SearchFailure(message: errorMessage.errorMessage)),
      (searchResult) => emit(
        SearchSuccess(
          searchedFood: searchResult,
        ),
      ),
    );
  }
}
