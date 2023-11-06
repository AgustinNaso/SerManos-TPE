import 'package:ser_manos/data/models/news_model.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';


class VolunteeringRepositoryImpl extends Repository<News> {
  VolunteeringRepositoryImpl() : super(tag: 'news');

  Future<List<News>> getNewsPaginated(int limit) async {
    final news = await collection.orderBy("id").limit(limit).get();
    return news.docs.map((e) => itemFromJson(e.id, e.data())).toList();
  }

  Future<List<News>> getNewsPaginatedAfter(
      int limit, News startAfter) async {
    final news = await collection
        .orderBy("")
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
        .orderBy("")
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
