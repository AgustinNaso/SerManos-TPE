import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/models/volunteering_model.dart';
import 'package:ser_manos/providers/repository_provider.dart';

part 'search_bar_controller.g.dart';

@riverpod
class SearchBarController extends _$SearchBarController {
  @override
  Future<List<Volunteering>> build() async {
    final volunteerings = await getVolunteerings(null);
    return volunteerings;
  }

  Future<void> search(String? query) async {
    state = AsyncValue.data(await getVolunteerings(query));
  }

  Future<List<Volunteering>> getVolunteerings(String? query) async {
    if (query == null || query.isEmpty) {
      return await ref.read(volunteeringRepositoryProvider).getVolunteerings();
    }
    return await ref
        .read(volunteeringRepositoryProvider)
        .getVolunteeringsByQuery(query);
  }
}
