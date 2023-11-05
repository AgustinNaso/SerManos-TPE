import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/volunteering_model.dart';
import '../providers/repository_provider.dart';

part 'volunteering_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Volunteering>> getVolunteerings(GetVolunteeringsRef ref) async {
  final volunteeringRepository = ref.read(volunteeringRepositoryProvider);
  return await volunteeringRepository.getVolunteeringsPaginated(100);
}
