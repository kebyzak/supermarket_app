// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:supermarket_app/data/services/user_repository.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;

  SignInBloc({required this.userRepository}) : super(SignInInitial()) {
    on<SignInRequested>((event, state) async {
      emit(SignInLoading());
      try {
        await userRepository.signIn(
            password: event.password, email: event.email);
        emit(SignInSuccess());
      } catch (e) {
        emit(SignInError(e.toString()));
      }
    });
  }
}
