import 'package:ser_manos/data/models/news_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';


class NewsRepositoryImpl extends Repository<News> {
  NewsRepositoryImpl() : super('news');

  Future<List<News>> getNews() async {
    return getDocuments();
  }

  @override
  News itemFromJson(String id, Map<String, dynamic> json) {
    json["id"] = id;
    return News.fromJson(json);
  }
}
