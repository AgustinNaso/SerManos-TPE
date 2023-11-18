import 'package:ser_manos/data/repositories/repository.dart';

import '../models/volunteering_model.dart';

class VolunteeringRepositoryImpl extends Repository<Volunteering> {
  VolunteeringRepositoryImpl({firestore})
      : super('volunteering', firestore: firestore);

  Future<List<Volunteering>> getVolunteerings() async {
    return getDocuments();
  }

  Future<List<Volunteering>> getVolunteeringsByQuery(String name) async {
    return (await getDocuments())
        .where((element) => element.name.toLowerCase().contains(name))
        .toList();
  }

  @override
  Volunteering itemFromJson(String id, Map<String, dynamic> json) {
    json["id"] = id;
    return Volunteering.fromJson(json);
  }
}
