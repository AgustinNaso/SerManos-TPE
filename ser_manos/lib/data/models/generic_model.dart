import 'package:ser_manos/data/models/json_serializable.dart';
import 'package:equatable/equatable.dart';


abstract class GenericModel<T> extends Equatable  implements JsonSerializable<T> {
  final String id;

  const GenericModel({required this.id});

  
  @override
  List<Object?> get props => [id];
}
