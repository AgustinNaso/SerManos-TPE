import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/models/volunteering_details_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';
import 'package:ser_manos/exceptions/not_found_exception.dart';

class VolunteeringDetailsRepositoryImpl extends Repository<VolunteeringDetails> { // transform into Voluteering Details model
  VolunteeringDetailsRepositoryImpl() : super(tag: 'volunteering_details');

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
