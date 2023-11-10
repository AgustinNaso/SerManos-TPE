import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';

import '../models/volunteering_model.dart';

class VolunteeringRepositoryImpl extends Repository<Volunteering> {
  VolunteeringRepositoryImpl() : super('volunteering');

  Future<List<Volunteering>> getVolunteerings() async {
    return getDocuments();
  }

  @override
  Volunteering itemFromJson(String id, Map<String, dynamic> json) {
    json["id"] = id;
    return Volunteering.fromJson(json);
  }
}
