import 'package:ser_manos/data/models/news_model.dart';

import '../mocked_lists.dart';

Future<List<News>> getMockedNews(ref) async {
  return news_mocked_list;
}

Future<News> getMockedNewsById(ref) async {
  return news_mocked_list[0];
}