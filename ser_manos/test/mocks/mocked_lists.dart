import 'package:ser_manos/data/models/news_model.dart';
import 'package:ser_manos/data/models/volunteering_model.dart';

final news_mocked_list = [
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

final mocked_volunteering_list = [
  Volunteering(
    imgUrl: 'imgUrl1',
    name: 'name1',
    category: 'category1',
    vacancies: 1,
    location: 'location1',
    id: '1'),
  Volunteering(
    imgUrl: 'imgUrl2',
    name: 'name2',
    category: 'category2',
    vacancies: 2,
    location: 'location2',
    id: '2'),
];