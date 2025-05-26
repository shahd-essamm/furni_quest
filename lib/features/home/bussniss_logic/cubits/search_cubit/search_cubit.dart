import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furni_quest/features/home/data/models/search_model/search_model.dart';
import 'package:furni_quest/features/home/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitial());

  void searchProduct(SearchModel searchModel) async {
    emit(SearchInitial());
    try {
      final response = await searchRepo.searchProduct(searchModel);
      emit(SearchProductLoaded(response));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

}
