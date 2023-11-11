final postulationProvider =
    StateNotifierProvider<PostulationProvider, PostulationState>((ref) {
  return PostulationProvider(ref.read);
});

class PostulationProvider extends StateNotifier<PostulationState> {
  final Reader _read;

  PostulationProvider(this._read) : super(const PostulationState());

  Future<void> postulate(String volunteeringId) async {
    state = state.copyWith(status: PostulationStatus.loading);
    try {
      await _read(postulationRepositoryProvider).postulate(volunteeringId);
      state = state.copyWith(status: PostulationStatus.success);
    } catch (e) {
      state = state.copyWith(status: PostulationStatus.error);
    }
  }

  Future<void> withdrawPostulation(String volunteeringId) async {
    state = state.copyWith(status: PostulationStatus.loading);
    try {
      await _read(postulationRepositoryProvider)
          .withdrawPostulation(volunteeringId);
      state = state.copyWith(status: PostulationStatus.success);
    } catch (e) {
      state = state.copyWith(status: PostulationStatus.error);
    }
  }
}
