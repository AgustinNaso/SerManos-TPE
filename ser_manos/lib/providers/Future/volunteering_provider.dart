import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/models/volunteering_details_model.dart';
import '../../data/models/volunteering_model.dart';
import '../repository_provider.dart';

part 'volunteering_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Volunteering>> getVolunteerings(GetVolunteeringsRef ref) async {
  final volunteeringRepository = ref.read(volunteeringRepositoryProvider);
  return await volunteeringRepository.getVolunteerings();
}

@Riverpod(keepAlive: true)
Future<VolunteeringDetails> getVolunteeringDetails(
    GetVolunteeringDetailsRef ref, String id) async {
  final volunteeringRepositoryDetails =
      ref.read(volunteeringDetailsRepositoryProvider);
  return await volunteeringRepositoryDetails
      .getVolunteeringDetailsByVolunteeringId(id);
}
