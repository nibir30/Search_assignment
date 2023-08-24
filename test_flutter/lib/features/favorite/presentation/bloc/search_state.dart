part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchErrorState extends SearchState {
  final String errorMsg;
  SearchErrorState(this.errorMsg);
}

class SearchLoadingState extends SearchState {}

class SearchCreatedState extends SearchState {
  final ProfileResponseEntity profileResponseEntity;

  SearchCreatedState(
    this.profileResponseEntity,
  );
}

class SearchSuccessState extends SearchState {}
