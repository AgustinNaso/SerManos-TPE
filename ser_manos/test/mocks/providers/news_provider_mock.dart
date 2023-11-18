import 'package:ser_manos/data/models/news_model.dart';

import '../mocked_lists.dart';

Future<List<News>> getMockedNews(ref) async {
  return newsMockedList;
}

Future<News> getMockedNewsById(ref) async {
  return newsMockedList[0];
}
