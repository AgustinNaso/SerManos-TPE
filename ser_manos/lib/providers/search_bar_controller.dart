import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/models/volunteering_model.dart';
import 'package:ser_manos/providers/Future/volunteering_provider.dart';

part 'search_bar_controller.g.dart';

@riverpod
class SearchBarController extends _$SearchBarController {
  @override
  Future<List<Volunteering>> build() async {
    final volunteeringList = ref.read(getVolunteeringsProvider);
    return volunteeringList.when(
        data: (data) => data,
        error: ((error, stackTrace) => []),
        loading: () => []);
  }

  Future<void> search(String? query) async {
    final volunteeringList = ref.read(getVolunteeringsProvider);

    if (query == null || query.isEmpty) {
      state = volunteeringList;
    } else {
      state = volunteeringList.whenData((data) {
        return data
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }
}
