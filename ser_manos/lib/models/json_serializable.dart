
abstract class JsonSerializable<T> {
  Map<String, dynamic> toJson();

  // weird without return type but it works
  static fromJson(Map<String, dynamic> json) {}
}