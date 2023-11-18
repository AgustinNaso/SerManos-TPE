import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ser_manos/data/models/news_model.dart';
import 'package:ser_manos/data/repositories/news_repository_impl.dart';
import '../mocks/mocked_lists.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late NewsRepositoryImpl newsRepositoryImpl;

  setUpAll(() async {
    fakeFirestore = FakeFirebaseFirestore();
    newsRepositoryImpl = NewsRepositoryImpl(firestore: fakeFirestore);
    for (var news in newsMockedList) {
      await fakeFirestore.collection('news').doc(news.id).set(news.toJson());
    }
  });

  test("get all news.", () async {
    final news = await newsRepositoryImpl.getNews();
    expect(news, newsMockedList);
  });

  test("get news by id", () async {
    for (int i = 0; i < newsMockedList.length; i++) {
      final News retrievedNew =
          await newsRepositoryImpl.getNewsById(newsMockedList[i].id.toString());
      expect(retrievedNew, newsMockedList[i]);
    }
  });
}
