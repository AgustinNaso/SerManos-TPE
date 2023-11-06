import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';

import '../models/volunteering_model.dart';

class VolunteeringRepositoryImpl extends Repository<Volunteering> {
  VolunteeringRepositoryImpl() : super(tag: 'volunteering');

  Future<List<Volunteering>> getVolunteeringsPaginated(int limit) async {
    final volunteerings = await collection.limit(limit).get();
    return volunteerings.docs.map((e) => itemFromJson(e.id, e.data())).toList();
  }

  Future<List<Volunteering>> getVolunteeringsPaginatedAfter(
      int limit, Volunteering startAfter) async {
    final volunteerings = await collection
        .startAfter([
          {'id': startAfter.id}
        ])
        .limit(limit)
        .get();
    return volunteerings.docs.map((e) => itemFromJson(e.id, e.data())).toList();
  }

  Future<List<Volunteering>> getVolunteeringsPaginatedByName(
      int limit, SermanosUser startAfter, String name) async {
    // by name or what?
    final volunteerings = await collection
        .where({name: name})
        .startAfter([
          {'id': startAfter.id}
        ])
        .limit(limit)
        .get();

    return volunteerings.docs.map((e) => itemFromJson(e.id, e.data())).toList();
  }

  @override
  Volunteering itemFromJson(String id, Map<String, dynamic> json) {
    json["id"] = id;
    return Volunteering.fromJson(json);
  }
}
