import 'package:ser_manos/data/models/generic_model.dart';

class VolunteeringDetails extends GenericModel<VolunteeringDetails> {
  final String description;
  final String about;
  final List<String> requirements;
  final List<String> availability;
  final String imgUrl;
  final String name;
  final String category;
  final int vacancies;
  final String location;
  final String volunteeringId;
  final List<(String, bool)> volunteers;

  VolunteeringDetails({
    required String id,
    required this.description,
    required this.about,
    required this.requirements,
    required this.availability,
    required this.imgUrl,
    required this.name,
    required this.category,
    required this.vacancies,
    required this.location,
    required this.volunteeringId,
    required this.volunteers,
  }) : super(id: id);

  @override
  static VolunteeringDetails fromJson(Map<String, dynamic> json) {
    print(json['volunteers']);
    return VolunteeringDetails(
      description: json['description'],
      about: json['about'],
      requirements:
          (json['requirements'] as List).map((item) => item as String).toList(),
      availability:
          (json['availability'] as List).map((item) => item as String).toList(),
      id: json['id'],
      imgUrl: json['imgUrl'],
      name: json['name'],
      category: json['category'],
      vacancies: json['vacancies'],
      location: json['location'],
      volunteeringId: json['volunteeringId'],
      volunteers: (json['volunteers'] as Map<String, dynamic>).entries.map((e) => (e.key, e.value as bool)).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'about': about,
      'requirements': requirements,
      'availability': availability,
      'imgUrl': imgUrl,
      'name': name,
      'category': category,
      'vacancies': vacancies,
      'location': location,
      'volunteeringId': volunteeringId,
      'volunteers': Map<String, bool>.fromEntries(volunteers.map((entry) => MapEntry(entry.$1, entry.$2))),
    };
  }

  @override
  String toString() {
    return 'VolunteeringDetails{volunteeringId: $volunteeringId, description: $description, about: $about, requirements: $requirements, availability: $availability, id: $id, imgUrl: $imgUrl, name: $name, category: $category, vacancies: $vacancies, location: $location}';
  }
}
