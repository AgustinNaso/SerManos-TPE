import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/models/volunteering_details_model.dart';
import 'package:ser_manos/data/repositories/repository.dart';

class VolunteeringDetailsRepositoryImpl extends Repository<VolunteeringDetails> { // transform into Voluteering Details model
  VolunteeringDetailsRepositoryImpl() : super(tag: 'volunteering_details');


  // TODO: Remove this it is done on Repository<T?>
  Future<VolunteeringDetails> getVolunteeringDetailsById(String id) async {
    try {
        return await getById(id);
    } catch (e) {
      print(e);
      // Rethrow the exception or handle it as needed.
      throw e; // probably not found exception
    }
  }

  @override
  VolunteeringDetails itemFromJson(Map<String, dynamic> json) {
    return VolunteeringDetails.fromJson(json);
  }

}
