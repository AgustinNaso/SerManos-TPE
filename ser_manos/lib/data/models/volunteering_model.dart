import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/data/models/generic_model.dart';

class Volunteering extends GenericModel<Volunteering> {
  final String imgUrl;
  final String name;
  final String category;
  final int vacancies;
  final GeoPoint location;

  const Volunteering({
    required String id,
    required this.imgUrl,
    required this.name,
    required this.category,
    required this.vacancies,
    required this.location,
  }) : super(id: id);

  @override
  static Volunteering fromJson(Map<String, dynamic> json) {
    return Volunteering(
      id: json['id'],
      imgUrl: json['imgUrl'],
      name: json['name'],
      category: json['category'],
      vacancies: json['vacancies'],
      location: json['location'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'imgUrl': imgUrl,
      'name': name,
      'category': category,
      'vacancies': vacancies,
      'location': location
    };
  }

  @override
  String toString() {
    return 'Volunteering{id: $id, imgUrl: $imgUrl, name: $name, category: $category, vacancies: $vacancies, location: $location}';
  }
}
