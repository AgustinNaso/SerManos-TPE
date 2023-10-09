

class SermanosUser {
  final email;
  final name;
  final lastname;

  SermanosUser({this.email, this.name, this.lastname});

  static SermanosUser fromJson(Map<String, dynamic> json) {
    return SermanosUser(
      email: json['email'],
      name: json['name'],
      lastname: json['lastname']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'lastname': lastname
    };
  }
}