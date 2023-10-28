import 'gender.dart';
import 'json_serializable.dart';

class SermanosUser extends JsonSerializable<SermanosUser> {
  final String id;
  final String email;
  final String name;
  final String lastName;
  final String? phoneNumber;
  final Gender? gender;
  final DateTime? birthDate;
  final String? profileImgUrl;
  final String? contactEmail;

  SermanosUser(
      {required this.id,
      required this.email,
      required this.name,
      required this.lastName,
      this.phoneNumber,
      this.gender,
      this.birthDate,
      this.profileImgUrl,
      this.contactEmail});

  @override
  static SermanosUser fromJson(Map<String, dynamic> json) {
    return SermanosUser(
      id: json['id'] ?? "1 ue",
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
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'gender': gender != null ? gender!.index : null,
      'birthDate': birthDate != null ? birthDate!.toIso8601String() : null,
      'profileImgUrl': profileImgUrl,
      'contactEmail': contactEmail,
    };
  }

  @override
  String toString() {
    return 'SermanosUser{id: $id, email: $email, name: $name, lastName: $lastName, phoneNumber: $phoneNumber, gender: $gender, birthDate: $birthDate, profileImgUrl: $profileImgUrl, contactEmail: $contactEmail}';
  }
}
