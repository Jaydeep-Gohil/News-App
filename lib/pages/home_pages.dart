import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:news_app/widgets/search_field.dart';

class HomePages extends ConsumerWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final newsState = ref.watch(newsStateProvider);
  final NewsModel news = newsState.newsModel;
  final bool isLoading = newsState.isLoading;

    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: SafeArea(
        child: Column(
          children: [
            const SearchField(),
            if (isLoading)
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else if ((news.results?.isEmpty ?? true))
              Expanded(
                child: Center(
                  child: Text(
                    'No articles found.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: news.results?.length ?? 0,
                  itemBuilder: (context, index) {
                    return NewsCard(article: news.results![index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
