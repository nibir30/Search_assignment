import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_flutter/features/favorite/domain/entity/get_profile_data_entity.dart';

import '../../../../api_gateway/repositories/login_repository/search_repository.dart';
import '../../domain/usecase/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<RequestSearchEvent>(_onRequestSearch);
  }

  Future<void> _onRequestSearch(final RequestSearchEvent event, final Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    final SearchRepository _repository = SearchRepositoryImpl();
    final SearchUseCase _useCase = SearchUseCase(searchRepository: _repository);
    final ProfileResponseEntity? _entity = await _useCase.getSearchData();

    if (_entity != null) {
      emit(SearchCreatedState(_entity));
    } else {
      emit(SearchErrorState("Unable to send Search Data"));
    }
  }
}
