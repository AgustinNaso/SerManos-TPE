import 'package:ser_manos/models/json_serializable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Repository<T extends JsonSerializable<T>> {
  final String tag; // this is the name of the collection in firestore
  late final CollectionReference<Map<String, dynamic>> collection;

  Repository({required this.tag}) {
    this.collection = FirebaseFirestore.instance.collection(this.tag);
  }
  // Add other common repository methods here.

  Future<T> create(T item) async {
    try {
      await collection.add(item.toJson());
    } catch (e) {
      print(e);
      rethrow;
    }
    return Future.value(item);
  }

  Future<T?> getById(String id) async {
    final doc = await collection.doc(id).get();
    if (doc.exists) {
      final data = doc.data();
      return data != null ? itemFromJson(data) : null;
    }
    return null;
  }

  Future<T> update(String id,T item) async {
    try {
      await collection.doc(id).update(item.toJson());
    } catch (e) {
      print(e);
      rethrow;
    }
    return Future.value(item);
  }

  // Factory method to create an instance of T from JSON data
  T itemFromJson(Map<String, dynamic> json);
}