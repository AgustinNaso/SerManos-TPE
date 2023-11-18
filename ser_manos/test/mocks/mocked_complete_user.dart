import 'package:ser_manos/data/models/gender.dart';
import 'package:ser_manos/data/models/user_model.dart';
import 'package:ser_manos/data/models/volunteering_postulation.dart';

SermanosUser mockedCompleteUser = SermanosUser(
  id: '1',
  name: 'John',
  lastName: 'Doe',
  email: 'johndoe@mail.com',
  phoneNumber: '1165678451',
  gender: Gender.male,
  birthDate: DateTime.now(),
  profileImgUrl: "",
  contactEmail: 'contactjohn@mail.com',
  favVolunteerings: const ['1', '2', '3'],
  volunteeringPostulation: const VolunteeringPostulation(
      volunteeringId: '1', status: VolunteeringPostulationStatus.pending),
);
