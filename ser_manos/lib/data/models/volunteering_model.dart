import 'json_serializable.dart';

class Volunteering extends JsonSerializable<Volunteering> {
  final String id;
  final String imgUrl;
  final String name;
  final String category;
  final int vacancies;
  final String location;

  Volunteering(
       this.id,
       this.imgUrl,
       this.name,
       this.category,
       this.vacancies,
       this.location);

  @override
  static Volunteering fromJson(Map<String, dynamic> json) {
    return Volunteering(
      json['id'] ?? "1 ue",
      json['imgUrl'],
      json['name'],
      json['category'],
      json['vacancies'],
      json['location'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'name': name,
      'category': category,
      'vacancies': vacancies,
      'location': location,
    };
  }

  @override
  String toString() {
    return 'Volunteering{id: $id, imgUrl: $imgUrl, name: $name, category: $category, vacancies: $vacancies, location: $location}';
  }
}
