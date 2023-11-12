import 'package:ser_manos/data/models/generic_model.dart';
import 'package:ser_manos/data/models/volunteering_postulation.dart';

import 'gender.dart';

class SermanosUser extends GenericModel<SermanosUser> {
  final String email;
  final String name;
  final String lastName;
  final String? phoneNumber;
  final Gender? gender;
  final DateTime? birthDate;
  final String? profileImgUrl;
  final String? contactEmail;
  final List<String> favVolunteerings;
  VolunteeringPostulation? volunteeringPostulation;

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
      this.volunteeringPostulation,
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
            ? DateTime.parse(json['birthDate'])
            : null,
        profileImgUrl: json['profileImgUrl'],
        contactEmail: json['contactEmail'],
        favVolunteerings: json['favVolunteerings'] != null
            ? (json['favVolunteerings'] as List)
                .map((item) => item as String)
                .toList()
            : [],
        volunteeringPostulation:
            VolunteeringPostulation.fromJson(json['volunteeringPostulation']));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'gender': gender != null ? gender!.index : null,
      'birthDate': birthDate != null ? birthDate!.toIso8601String() : null,
      'profileImgUrl': profileImgUrl,
      'contactEmail': contactEmail,
      'favVolunteerings': favVolunteerings,
      'volunteeringPostulation': volunteeringPostulation?.toJson(),
    };
  }

  @override
  String toString() {
    return 'SermanosUser{id: $id, email: $email, name: $name, lastName: $lastName, phoneNumber: $phoneNumber, gender: $gender, birthDate: $birthDate, profileImgUrl: $profileImgUrl, contactEmail: $contactEmail}';
  }
}
