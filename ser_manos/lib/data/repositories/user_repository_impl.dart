import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';
import 'package:ser_manos/exceptions/not_found_exception.dart';

class UserRepositoryImpl extends Repository<SermanosUser> {
  UserRepositoryImpl() : super('users');

  Future<SermanosUser> createUser(SermanosUser user) async {
    return await create(user);
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

  Future<SermanosUser> getUsersById(String id) async {
    try {
      final querySnapshot = await collection.doc(id).get();
      if (querySnapshot.exists) {
        final user = itemFromJson(id, querySnapshot.data()!);
        return user;
      } else {
        throw NotFoundException("User with id $id not found");
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
