import 'package:ser_manos/data/models/news_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';

import '../../exceptions/not_found_exception.dart';

class NewsRepositoryImpl extends Repository<News> {
  NewsRepositoryImpl({firestore}) : super('news', firestore: firestore);

  Future<List<News>> getNews() async {
    return getDocuments();
  }

  Future<News> getNewsById(String id) async {
    try {
      final querySnapshot = await collection.doc(id).get();
      if (querySnapshot.exists) {
        final user = itemFromJson(id, querySnapshot.data()!);
        return user;
      } else {
        throw NotFoundException("News with id $id not found");
      }
    } catch (e) {
      print(e);
      // Rethrow the exception or handle it as needed.
      throw e;
    }
  }

  @override
  News itemFromJson(String id, Map<String, dynamic> json) {
    json["id"] = id;
    return News.fromJson(json);
  }
}
