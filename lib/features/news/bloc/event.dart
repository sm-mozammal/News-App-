import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
  @override
  List<Object?> get props => [];
}

class NewsInitialFetchEvent extends NewsEvent {}

class NewsSearchEvent extends NewsEvent {
  final String? searchText;
  const NewsSearchEvent({this.searchText});
}
