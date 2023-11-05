import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';

import '../models/volunteering_model.dart';


class VolunteeringRepositoryImpl extends Repository<Volunteering> { // transform into Voluteering model
  VolunteeringRepositoryImpl() : super(tag: 'volunteering');

  Future<List<Volunteering>> getVolunteeringsPaginated(int limit) async {
    final volunteerings = await collection.orderBy("id").limit(limit).get();
    return volunteerings.docs.map((e) => itemFromJson(e.data())).toList();
  }

  Future<List<Volunteering>> getVolunteeringsPaginatedAfter(int limit, Volunteering startAfter) async {
    final volunteerings = await collection.orderBy("some time shit").startAfter([{ 'name||id': startAfter.id }]).limit(limit).get();

    return volunteerings.docs.map((e) => itemFromJson(e.data())).toList();
  }

  Future<List<Volunteering>> getVolunteeringsPaginatedByName(int limit, SermanosUser startAfter, String name) async { // by name or what?
    final volunteerings = await collection.where({name: name}).orderBy("some time shit").startAfter([{ 'id': startAfter.id }]).limit(limit).get();

    return volunteerings.docs.map((e) => itemFromJson(e.data())).toList();
  }

  @override
  Volunteering itemFromJson(Map<String, dynamic> json) {
    return Volunteering.fromJson(json);
  }

}
