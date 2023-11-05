import 'package:ser_manos/data/models/volunteering_model.dart';

import 'json_serializable.dart';

class VolunteeringDetails extends JsonSerializable<VolunteeringDetails> {
  final description;
  final about;
  final List<String> requirements;
  final List<String> availability;
  final String id;
  final String imgUrl;
  final String name;
  final String category;
  final int vacancies;
  final String location;


  VolunteeringDetails(
      this.description,
      this.about,
      this.requirements,
      this.availability,
      this.id,
      this.imgUrl,
      this.name,
      this.category,
      this.vacancies,
      this.location);

  @override
  static VolunteeringDetails fromJson(Map<String, dynamic> json) {
    return VolunteeringDetails(
      json['description'],
      json['about'],
      json['requirements'],
      json['availability'],
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
      'description': description,
      'about': about,
      'requirements': requirements,
      'availability': availability,
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
    return 'VolunteeringDetails{description: $description, about: $about, requirements: $requirements, availability: $availability, id: $id, imgUrl: $imgUrl, name: $name, category: $category, vacancies: $vacancies, location: $location}';
  }
}