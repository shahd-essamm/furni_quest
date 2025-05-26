part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

class SearchProductLoaded extends SearchState {
  final List<SearchModel> searchModel;
  const SearchProductLoaded(this.searchModel);

  @override
  List<Object> get props => [searchModel];
}

class SearchLoading extends SearchState {}
class SearchError extends SearchState {
  final String error;
  const SearchError(this.error);

  @override
  List<Object> get props => [error];
}