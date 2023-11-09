import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/repositories/news_repository_impl.dart';

import '../../data/models/news_model.dart';

part 'news_provider.g.dart';

@riverpod
Future<List<News>> getNews(GetNewsRef ref) async {
  final newsRepository = NewsRepositoryImpl();
  return await newsRepository.getNewsPaginated(100);
}
