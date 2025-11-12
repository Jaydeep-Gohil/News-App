import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_services.dart';

class NewsState {
  final bool isLoading;
  final NewsModel newsModel;

  const NewsState({this.isLoading = true, required this.newsModel});

  NewsState copyWith({bool? isLoading, NewsModel? newsModel}) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      newsModel: newsModel ?? this.newsModel,
    );
  }
}

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier() : super(NewsState(newsModel: NewsModel(results: []))) {
    loadNews();
  }


  NewsState get current => state;

  Future<void> loadNews() async {
    state = state.copyWith(isLoading: true);
    try {
      final newsResponse = await NewsServices().fetchNews();
      final networkStopwatch = Stopwatch()..start();

      if (newsResponse is Map && newsResponse.containsKey('results')) {
        final results = newsResponse['results'];
        debugPrint('fetchNews: results type=${results.runtimeType} length=${(results is List) ? results.length : 'N/A'}');
      } else {
        debugPrint('fetchNews: response type=${newsResponse.runtimeType} keys=${(newsResponse is Map) ? newsResponse.keys.toList() : 'N/A'}');
      }
      if (newsResponse == null) {
        
        state = state.copyWith(newsModel: NewsModel(results: []), isLoading: false);
        return;
      }
      
      final parseStopwatch = Stopwatch()..start();
  final news = await compute(NewsModel.parseNewsModel, newsResponse);
      parseStopwatch.stop();
      networkStopwatch.stop();
      
      print('NewsNotifier.loadNews: parse ${parseStopwatch.elapsedMilliseconds} ms, total-with-network ${networkStopwatch.elapsedMilliseconds} ms');
      state = state.copyWith(newsModel: news, isLoading: false);
    } catch (e, st) {
      
      debugPrint('NewsNotifier.loadNews error: $e');
      debugPrint('$st');
      state = state.copyWith(newsModel: NewsModel(results: []), isLoading: false);
    }
  }

  Future<void> loadSearchNews(String title) async {
    state = state.copyWith(isLoading: true);
    try {
      final newsResponse = await NewsServices().fetchNewsBySearching(title);
      final networkStopwatch = Stopwatch()..start();
      if (newsResponse is Map && newsResponse.containsKey('results')) {
        final results = newsResponse['results'];
        debugPrint('fetchSearchNews: results type=${results.runtimeType} length=${(results is List) ? results.length : 'N/A'}');
      } else {
        debugPrint('fetchSearchNews: response type=${newsResponse.runtimeType} keys=${(newsResponse is Map) ? newsResponse.keys.toList() : 'N/A'}');
      }
      if (newsResponse == null) {
        state = state.copyWith(newsModel: NewsModel(results: []), isLoading: false);
        return;
      }
      final parseStopwatch = Stopwatch()..start();
  final news = await compute(NewsModel.parseNewsModel, newsResponse);
      parseStopwatch.stop();
      networkStopwatch.stop();
    
      print('NewsNotifier.loadSearchNews: parse ${parseStopwatch.elapsedMilliseconds} ms, total-with-network ${networkStopwatch.elapsedMilliseconds} ms');
      state = state.copyWith(newsModel: news, isLoading: false);
    } catch (e, st) {
      debugPrint('NewsNotifier.loadSearchNews error: $e');
      debugPrint('$st');
      state = state.copyWith(newsModel: NewsModel(results: []), isLoading: false);
    }
  }
}


final newsNotifierProvider = Provider<NewsNotifier>((ref) => NewsNotifier());

final newsStateProvider = Provider<NewsState>((ref) => ref.watch(newsNotifierProvider).current);

