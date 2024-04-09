import 'dart:async';
import 'dart:developer';
import 'package:bloc_practice/features/news/bloc/event.dart';
import 'package:bloc_practice/features/news/bloc/state.dart';
import 'package:bloc_practice/features/news/repository/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helper/di.dart';
import '../model/data_model.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitialState()) {
    on<NewsInitialFetchEvent>(newsInitialFetchEvent);
    on<NewsSearchEvent>(searchNews);
  }

  FutureOr<void> newsInitialFetchEvent(
      NewsInitialFetchEvent event, Emitter<NewsState> emit) async {
    try {
      // emit(NewsFetchingLoadingState());
      // NewsModel newss = await locator.get<FetchApi>().getPost();
      NewsModel newss = await locator.get<NewsRepository>().getPost();
      log(newss.toString());
      emit(NewsFetchSuccessFullState(newses: newss));
    } catch (error) {
      emit(NewsFetchingErrorState(massage: error.toString()));
    }
  }

  FutureOr<void> searchNews(
      NewsSearchEvent event, Emitter<NewsState> emit) async {
    try {
      if (event.searchText != null || event.searchText!.isNotEmpty) {
        NewsModel newss = await locator
            .get<NewsRepository>()
            .getPost(searchText: event.searchText!);
        // log(newss.toString());
        emit(NewesSearchResaltState(newses: newss));
      } else {
        emit(const NewesSearchResaltState(newses: null));
      }
    } catch (e) {
      emit(NewsFetchingErrorState(massage: e.toString()));
    }
  }
}
