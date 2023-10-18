import 'package:ser_manos/exceptions/not_found_exception.dart';
import 'package:ser_manos/models/repositories/repository.dart';

import '../user_model.dart';

class UserRepositoryImpl extends Repository<SermanosUser> {
  UserRepositoryImpl() : super(tag: 'users');

  // @throws NotFoundException
  Future<SermanosUser> getUserByEmail(String email) async {
    try {
      final querySnapshot = await collection.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        final user = itemFromJson(querySnapshot.docs.first.data());
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
  SermanosUser itemFromJson(Map<String, dynamic> json) {
    return SermanosUser.fromJson(json);
  }

}
