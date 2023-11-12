import 'package:ser_manos/data/models/json_serializable.dart';

abstract class GenericModel<T> implements JsonSerializable<T> {
  String id;

  GenericModel({required this.id});
}
