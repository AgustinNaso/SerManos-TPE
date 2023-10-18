import 'gender.dart';
import 'json_serializable.dart';

class SermanosUser extends JsonSerializable<SermanosUser> {
  final String id;
  final String email;
  final String name;
  final String lastname;
  final String? phonenumber;
  final Gender? gender;
  final DateTime? birthdate;
  final String? profileImgUrl;
  final String? contactEmail;

  SermanosUser(
      {required this.id,
      required this.email,
      required this.name,
      required this.lastname,
      this.phonenumber,
      this.gender,
      this.birthdate,
      this.profileImgUrl,
      this.contactEmail});

  @override
  static SermanosUser fromJson(Map<String, dynamic> json) {
    return SermanosUser(
      id: json['id'] ?? "1 ue",
      email: json['email'],
      name: json['name'],
      lastname: json['lastname'],
      phonenumber: json['phonenumber'],
      gender: json['gender'] != null ? Gender.values[json['gender']] : null,
      birthdate: json['birthdate'] != null
          ? DateTime.parse(json['birthdate'])
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
      'lastname': lastname,
      'phonenumber': phonenumber,
      'gender': gender != null ? gender!.index : null,
      'birthdate': birthdate != null ? birthdate!.toIso8601String() : null,
      'profileImgUrl': profileImgUrl,
      'contactEmail': contactEmail,
    };
  }

  @override
  String toString() {
    return 'SermanosUser{id: $id, email: $email, name: $name, lastname: $lastname, phonenumber: $phonenumber, gender: $gender, birthdate: $birthdate, profileImgUrl: $profileImgUrl, contactEmail: $contactEmail}';
  }
}
