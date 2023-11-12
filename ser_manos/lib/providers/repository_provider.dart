import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/data/repositories/volunteering_details_repository_impl.dart';
import 'package:ser_manos/data/repositories/volunteering_repository_impl.dart';

import '../data/repositories/news_repository_impl.dart';
import '../data/repositories/user_repository_impl.dart';

part 'repository_provider.g.dart';

@riverpod
VolunteeringRepositoryImpl volunteeringRepository(
    VolunteeringRepositoryRef ref) {
  return VolunteeringRepositoryImpl();
}

@riverpod
VolunteeringDetailsRepositoryImpl volunteeringDetailsRepository(
    VolunteeringDetailsRepositoryRef ref) {
  return VolunteeringDetailsRepositoryImpl();
}

@riverpod
UserRepositoryImpl userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl();
}

@riverpod
NewsRepositoryImpl newsRepository(NewsRepositoryRef ref) {
  return NewsRepositoryImpl();
}
