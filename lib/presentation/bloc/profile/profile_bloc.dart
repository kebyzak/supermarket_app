import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supermarket_app/data/services/user_repository.dart';

part 'profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  final UserRepository userRepository;

  ProfileBloc({required this.userRepository}) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      final user = await userRepository.getUser();

      emit(ProfileSuccess(user: user));
    } catch (e) {
      emit(ProfileError(error: 'Failed to load profile: $e'));
    }
  }

  Future<void> signOut() async {
    try {
      await userRepository.signOut();
      emit(ProfileSignedOut());
    } catch (e) {
      emit(ProfileError(error: 'Failed to sign out: $e'));
    }
  }
}
