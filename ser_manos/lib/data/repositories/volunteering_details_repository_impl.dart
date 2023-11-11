import 'package:ser_manos/data/models/volunteering_details_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';
import 'package:ser_manos/exceptions/not_found_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteeringDetailsRepositoryImpl extends Repository<VolunteeringDetails> {
  VolunteeringDetailsRepositoryImpl() : super('volunteering_details');

  Future<List<VolunteeringDetails>> getVolunteeringDetailsByUserId(String uid) async {
    final details = await collection.where('volunteers', arrayContains: uid).get();

    if (details.docs.isNotEmpty) {
      final volunteeringDetails = details.docs.map((e) => itemFromJson(e.id, e.data())).toList();
      return volunteeringDetails;
    } else {
      return [];
    }
  }

  Future<void> addVolunteer(volunteeringDetailsId, uid) async {
    await collection.doc(volunteeringDetailsId).update({
      'volunteers.$uid': false
    });
  }

  Future<void> removeVolunteer(volunteeringDetailsId, uid) async {
    await collection.doc(volunteeringDetailsId).update({
      'volunteers.$uid': FieldValue.delete()
    });
  }

  Future<VolunteeringDetails> getVolunteeringDetailsByVolunteeringId(String id) async {
      final details = await collection.where('id', isEqualTo: id).get();

      if (details.docs.isNotEmpty) {
        final volunteeringDetails = itemFromJson(details.docs.first.id, details.docs.first.data());
        return volunteeringDetails;
      } else {
        throw NotFoundException("Volunteering details with id $id not found");
      }
  }

  @override
  VolunteeringDetails itemFromJson(String id, Map<String, dynamic> json) {
    json["id"] = id;
    return VolunteeringDetails.fromJson(json);
  }

}
