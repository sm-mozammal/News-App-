import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  @override
  List<Object?> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsFetchingErrorState extends NewsState {
  final String massage;
  const NewsFetchingErrorState({required this.massage});

  @override
  List<Object?> get props => [massage];
}

class NewsFetchSuccessFullState extends NewsState {
  final NewsModel newses;
  const NewsFetchSuccessFullState({required this.newses});

  @override
  List<Object?> get props => [newses];
}
// class NewsFetchSuccessFullState extends NewsState {
//   final NewsModel? newses;
//   final NewsModel? searchModel;
//   const NewsFetchSuccessFullState({this.newses, this.searchModel});

//   @override
//   List<Object?> get props => [newses];
// }

class NewesSearchState extends NewsState {}

class NewesSearchResaltState extends NewsState {
  final NewsModel? newses;
  const NewesSearchResaltState({this.newses});

  @override
  List<Object?> get props => [newses];
}
