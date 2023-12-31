import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final Reference userProfilesPictures = FirebaseStorage.instance.ref().child("profile_pictures");

  StorageService();

  /// Uploads a profile picture to the storage service and returns the download url
  /// @param userId the user id
  /// @param filePath can be getter using XFile file.path
  static Future<String> uploadProfilePicture(String userId, String filePath) async {
    final snapshot = await userProfilesPictures.child(userId).putFile(File(filePath));
    return snapshot.ref.getDownloadURL();
  }
}