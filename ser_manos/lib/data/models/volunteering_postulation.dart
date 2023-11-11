class VolunteeringPostulation {
  final String volunteeringId;
  final VolunteeringPostulationStatus status;

  const VolunteeringPostulation({
    required this.volunteeringId,
    required this.status,
  });
}

enum VolunteeringPostulationStatus {
  pending,
  accepted,
  notPostulated,
}
