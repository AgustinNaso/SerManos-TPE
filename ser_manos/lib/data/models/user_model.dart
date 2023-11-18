import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/data/models/generic_model.dart';
import 'package:ser_manos/data/models/volunteering_postulation.dart';

import 'gender.dart';

class SermanosUser extends GenericModel<SermanosUser> {
  final String email;
  final String name;
  final String lastName;
  String? phoneNumber;
  Gender? gender;
  DateTime? birthDate;
  String? profileImgUrl;
  String? contactEmail;
  final List<String> favVolunteerings;
  VolunteeringPostulation volunteeringPostulation;

  SermanosUser(
      {required this.email,
      required this.name,
      required this.lastName,
      this.phoneNumber,
      this.gender,
      this.birthDate,
      this.profileImgUrl,
      this.contactEmail,
      this.favVolunteerings = const [],
      required this.volunteeringPostulation,
      required String id})
      : super(id: id);

  bool isFaved(String volunteeringId) {
    return favVolunteerings.contains(volunteeringId);
  }

  get fullName => "$name $lastName";

  bool isProfileFilled() {
    return birthDate != null &&
        phoneNumber != null &&
        gender != null &&
        profileImgUrl != null &&
        contactEmail != null;
  }

  SermanosUser copy() {
    return SermanosUser(
        email: email,
        name: name,
        lastName: lastName,
        phoneNumber: phoneNumber,
        gender: gender,
        birthDate: birthDate,
        profileImgUrl: profileImgUrl,
        contactEmail: contactEmail,
        favVolunteerings: favVolunteerings,
        volunteeringPostulation: volunteeringPostulation,
        id: id);
  }

  @override
  static SermanosUser fromJson(Map<String, dynamic> json) {
    return SermanosUser(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        gender: json['gender'] != null ? Gender.values[json['gender']] : null,
        birthDate: json['birthDate'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(
                (json['birthDate'] as Timestamp).microsecondsSinceEpoch)
            : null,
        profileImgUrl: json['profileImgUrl'],
        contactEmail: json['contactEmail'],
        favVolunteerings: json['favVolunteerings'] != null
            ? (json['favVolunteerings'] as List)
                .map((item) => item as String)
                .toList()
            : [],
        volunteeringPostulation: json['volunteeringPostulation'] == null
            ? null
            : VolunteeringPostulation.fromJson(
                json['volunteeringPostulation']));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'gender': gender?.index,
      'birthDate': birthDate,
      'profileImgUrl': profileImgUrl,
      'contactEmail': contactEmail,
      'favVolunteerings': favVolunteerings,
      'volunteeringPostulation': volunteeringPostulation.toJson(),
    };
  }

  @override
  String toString() {
    return 'SermanosUser{id: $id, email: $email, name: $name, lastName: $lastName, phoneNumber: $phoneNumber, gender: $gender, birthDate: $birthDate, profileImgUrl: $profileImgUrl, contactEmail: $contactEmail}';
  }
}
