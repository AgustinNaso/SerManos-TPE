import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';
import 'package:ser_manos/exceptions/not_found_exception.dart';

class UserRepositoryImpl extends Repository<SermanosUser> {
  UserRepositoryImpl() : super(tag: 'users');

  Future<SermanosUser> createUser(SermanosUser user) async {
    try {
      await collection.doc(user.id).set(user.toJson());
    } catch (e) {
      print(e);
      rethrow;
    }
    return Future.value(user);
  }

  // @throws NotFoundException
  Future<SermanosUser> getUserByEmail(String email) async {
    try {
      final querySnapshot =
          await collection.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        final user = itemFromJson(
            querySnapshot.docs.first.id, querySnapshot.docs.first.data());
        return user;
      } else {
        throw NotFoundException("User with email $email not found");
      }
    } catch (e) {
      print(e);
      // Rethrow the exception or handle it as needed.
      throw e;
    }
  }

  @override
  SermanosUser itemFromJson(String id, Map<String, dynamic> json) {
    json["id"] = id;
    return SermanosUser.fromJson(json);
  }
}
