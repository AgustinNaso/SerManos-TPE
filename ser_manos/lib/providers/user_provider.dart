import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/models/volunteering_postulation.dart';
import 'package:ser_manos/providers/auth_provider.dart';
import 'package:ser_manos/providers/repository_provider.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class LoggedUser extends _$LoggedUser {
  @override
  SermanosUser? build() => null;

  Future<void> refresh() async {
    final user = await ref.read(firebaseAuthProvider).currentUser();
    if (user != null) {
      final loggedUser = await ref
          .read(userRepositoryProvider)
          .getUsersById(user.uid);
      state = loggedUser;
    }
  }

  void set(SermanosUser user) => state = user;

  void setVolunteeringPostulation(VolunteeringPostulation postulation) {
    state!.volunteeringPostulation = postulation;
    state = state!.copy();
  }

  void removeVolunteeringPostulation() {
    state!.volunteeringPostulation = const VolunteeringPostulation(
        volunteeringId: '',
        status: VolunteeringPostulationStatus.notPostulated);
    state = state!.copy();
  }

  void addFavVolunteering(String volunteeringId) {
    state!.favVolunteerings.add(volunteeringId);
    state = state!.copy();
  }

  void removeFavVolunteering(String volunteeringId) {
    state!.favVolunteerings.remove(volunteeringId);
    state = state!.copy();
  }

  void updateUser(Map<String, dynamic> newFields) {
    state!.profileImgUrl = newFields['profileImgUrl'];
    state!.contactEmail = newFields['contactEmail'];
    state!.birthDate = newFields['birthDate'];
    state!.phoneNumber = newFields['phoneNumber'];
    state!.gender = newFields['gender'];
    state = state!.copy();
  }
}
