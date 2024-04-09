// ignore_for_file: type_literal_in_constant_pattern
import 'dart:developer';
import 'package:auto_animated/auto_animated.dart';
import 'package:bloc_practice/features/news/bloc/bloc.dart';
import 'package:bloc_practice/features/news/bloc/event.dart';
import 'package:bloc_practice/features/news/bloc/state.dart';
import 'package:bloc_practice/features/news/presentation/widgets/news_card.dart';
import 'package:bloc_practice/helper/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsBloc newsBloc = NewsBloc();

  @override
  void initState() {
    super.initState();
    // newsBloc.add(NewsInitialFetchEvent());
    context.read<NewsBloc>().add(NewsInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Screen'),
      ),
      body: Column(
        children: [
          // TextField(
          //   onSubmitted: (value) {
          //     context.read<NewsBloc>().add(NewsSearchEvent(searchText: value));
          //   },
          //   onChanged: (value) {
          //     context.read<NewsBloc>().add(NewsSearchEvent(searchText: value));
          //   },
          //   decoration: const InputDecoration(hintText: 'search'),
          // ),
          Expanded(
            child: BlocConsumer<NewsBloc, NewsState>(
              buildWhen: (previous, current) => current is! NewsInitialState,
              // bloc: newsBloc,
              listener: (context, state) {
                if (state is NewsFetchSuccessFullState) {
                  ToastUtil.showShortToast('News Fetch Success Fully');
                }
                if (state is NewsFetchingErrorState) {
                  ToastUtil.showShortToast(state.massage);
                }
              },
              builder: (context, state) {
                log('build');
                switch (state.runtimeType) {
                  case NewsFetchSuccessFullState:
                    final fetchNews = state as NewsFetchSuccessFullState;
                    return LiveList(
                        showItemInterval: const Duration(milliseconds: 150),
                        showItemDuration: const Duration(milliseconds: 150),
                        reAnimateOnVisibility: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        itemCount: fetchNews.newses.articles!.length,
                        itemBuilder: (context, index, animation) {
                          final data = fetchNews.newses.articles![index];
                          return FadeTransition(
                            opacity: Tween<double>(begin: 0, end: 1.0)
                                .animate(animation),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, -0.2),
                                end: Offset.zero,
                              ).animate(animation),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: NewsCard(data: data),
                              ),
                            ),
                          );
                        });

                  case NewesSearchResaltState:
                    final fetchNews = state as NewesSearchResaltState;
                    log('build 2');
                    return LiveList(
                        showItemInterval: const Duration(milliseconds: 150),
                        showItemDuration: const Duration(milliseconds: 150),
                        reAnimateOnVisibility: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        itemCount: fetchNews.newses!.articles!.length,
                        itemBuilder: (context, index, animation) {
                          final data = fetchNews.newses!.articles![index];
                          return FadeTransition(
                            opacity: Tween<double>(begin: 0, end: 1.0)
                                .animate(animation),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: NewsCard(data: data),
                            ),
                          );
                        });
                  case NewsInitialState:
                    return const Center(child: CircularProgressIndicator());
                  case NewsFetchingErrorState:
                    return const Center(
                      child: Text('Failed to Fetch News'),
                    );
                  case NewsInitialState():
                    return const Center(child: CircularProgressIndicator());
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
