import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/data/models/news_model.dart';
import 'package:ser_manos/data/models/volunteering_model.dart';

final newsMockedList = [
  News(
      source: 'source1',
      title: 'title1',
      subtitle: 'subtitle1',
      imgUrl: 'imgUrl1',
      body: 'body1',
      id: '1'),
  News(
      source: 'source2',
      title: 'title2',
      subtitle: 'subtitle2',
      imgUrl: 'imgUrl2',
      body: 'body2',
      id: '2'),
];

final mockedVolunteeringList = [
  const Volunteering(
      imgUrl: 'imgUrl1',
      name: 'name1',
      category: 'category1',
      vacancies: 1,
      location: GeoPoint(0, 0),
      id: '1'),
  const Volunteering(
      imgUrl: 'imgUrl2',
      name: 'name2',
      category: 'category2',
      vacancies: 2,
      location: GeoPoint(0, 0),
      id: '2'),
];
