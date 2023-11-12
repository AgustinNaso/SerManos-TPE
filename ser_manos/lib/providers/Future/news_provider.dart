import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/providers/repository_provider.dart';

import '../../data/models/news_model.dart';

part 'news_provider.g.dart';

@riverpod
Future<List<News>> getNews(GetNewsRef ref) async {
  final newsRepository = ref.read(newsRepositoryProvider);
  return await newsRepository.getNews();
}

@riverpod
Future<News> getNewsById(GetNewsByIdRef ref, String id) async {
  final newsRepository = ref.read(newsRepositoryProvider);
  return await newsRepository.getNewsById(id);
}
