import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/complete_profile.dart';
import 'package:ser_manos/config/cellules/incomplete_profile.dart';
import 'package:ser_manos/data/models/gender.dart';
import 'package:ser_manos/data/models/user_model.dart';

class ProfileScreen extends ConsumerWidget {
  static const route = "/profile";
  static const routeName = "profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SermanosUser user = SermanosUser(
        id: "1",
        email: "gdeschant@itba.edu.ar",
        name: "gaston",
        lastName: "De Schant",
        birthDate: DateTime.now(),
        phoneNumber: "123456789",
        gender: Gender.noBinary,
        profileImgUrl:
            "https://imgv3.fotor.com/images/cover-photo-image/a-beautiful-girl-with-gray-hair-and-lucxy-neckless-generated-by-Fotor-AI.jpg",
        contactEmail:
            "nomecontacten@gmail.com"); // ref.watch(currentUserProvider);

    //TODO: user nunca null?
    if (user == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return user.isProfileFilled()
        ? CompleteProfile(user: user)
        : IncompleteProfile(user: user);
  }
}
