import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/models/volunteering_details_model.dart';
part 'postulate_to_edit_provider.g.dart';

@Riverpod(keepAlive: true)
class PostulatingVolunteering extends _$PostulatingVolunteering {
  @override
  VolunteeringDetails? build() => null;

  void set(VolunteeringDetails volunteeringDetails) {
    state = volunteeringDetails;
  }
}
