import 'package:ser_manos/data/models/json_serializable.dart';

enum VolunteeringPostulationStatus {
  pending,
  accepted,
  notPostulated,
}

class VolunteeringPostulation implements JsonSerializable<VolunteeringPostulation> {
  final String volunteeringId;
  final VolunteeringPostulationStatus status;

  const VolunteeringPostulation({
    required this.volunteeringId,
    required this.status,
  });

  static fromJson(Map<String, dynamic> json) {
    return VolunteeringPostulation(
      volunteeringId: json['volunteeringId'],
      status: VolunteeringPostulationStatus.values[json['status']],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'volunteeringId': volunteeringId,
      'status': status.index,
    };
  }
}
