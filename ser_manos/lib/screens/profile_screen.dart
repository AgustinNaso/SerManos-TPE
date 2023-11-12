import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/config/cellules/complete_profile.dart';
import 'package:ser_manos/config/cellules/incomplete_profile.dart';
import 'package:ser_manos/data/models/gender.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/providers/user_provider.dart';

class ProfileScreen extends ConsumerWidget {
  static const route = "/profile";
  static const routeName = "profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureUserData = ref.read(loggedUserProvider);

    return futureUserData!.isProfileFilled()
        ? CompleteProfile(user: futureUserData)
        : IncompleteProfile(user: futureUserData);
  }
}
