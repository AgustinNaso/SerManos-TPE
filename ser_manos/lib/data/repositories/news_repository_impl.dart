import 'package:ser_manos/data/models/news_model.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';


class NewsRepositoryImpl extends Repository<News> {
  NewsRepositoryImpl() : super(tag: 'news');

  Future<List<News>> getNewsPaginated(int limit) async {
    final news = await collection.limit(limit).get();
    return news.docs.map((e) => itemFromJson(e.id, e.data())).toList();
  }

  Future<List<News>> getNewsPaginatedAfter(
      int limit, News startAfter) async {
    final news = await collection
        .startAfter([{'id': startAfter.id}])
        .limit(limit)
        .get();
    return news.docs.map((e) => itemFromJson(e.id, e.data())).toList();
  }

  Future<List<News>> getNewsPaginatedByName(
      int limit, SermanosUser startAfter, String name) async {
    // by name or what?
    final news = await collection
        .where({name: name})
        .startAfter([
      {'id': startAfter.id}
    ])
        .limit(limit)
        .get();

    return news.docs.map((e) => itemFromJson(e.id, e.data())).toList();
  }

  @override
  News itemFromJson(String id, Map<String, dynamic> json) {
    json["id"] = id;
    return News.fromJson(json);
  }
}
