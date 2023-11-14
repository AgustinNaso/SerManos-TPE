import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/models/volunteering_postulation.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class LoggedUser extends _$LoggedUser {
  @override
  SermanosUser? build() => null;

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
}
