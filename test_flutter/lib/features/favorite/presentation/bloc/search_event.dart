part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class RequestSearchEvent extends SearchEvent {
  RequestSearchEvent();
}
