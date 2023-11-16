import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/data/models/generic_model.dart';
import 'package:ser_manos/data/models/volunteer_states.dart';

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
  final double price;
  final DateTime date;
  final Map<String, bool> volunteers;

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
    required this.price,
    required this.date,
  }) : super(id: id);

  VolunteerState getVolunteerState(String uid) {
    if (volunteers[uid] == null) {
      return VolunteerState.notVolunteered;
    }
    if (volunteers[uid] == true) {
      return VolunteerState.accepted;
    }
    return VolunteerState.pending;
  }

  @override
  static VolunteeringDetails fromJson(Map<String, dynamic> json) {
    print(json);
    return VolunteeringDetails(
      description: json['description'],
      about: json['about'],
      requirements:
          (json['requirements'] as List).map((item) => item as String).toList(),
      availability:
          (json['availability'] as List).map((item) => item as String).toList(),
      price: json['price'],
      date: DateTime.fromMicrosecondsSinceEpoch(
          (json['date'] as Timestamp).microsecondsSinceEpoch),
      id: json['id'],
      imgUrl: json['imgUrl'],
      name: json['name'],
      category: json['category'],
      vacancies: json['vacancies'],
      location: json['location'],
      volunteeringId: json['volunteeringId'],
      volunteers: Map<String, bool>.from(json['volunteers'] as Map<String, dynamic>),
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
      'volunteers': volunteers,
      'price': price,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'VolunteeringDetails{volunteeringId: $volunteeringId, description: $description, about: $about, requirements: $requirements, availability: $availability, id: $id, imgUrl: $imgUrl, name: $name, category: $category, vacancies: $vacancies, location: $location}';
  }
}
