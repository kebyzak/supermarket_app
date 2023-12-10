// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:supermarket_app/data/services/user_repository.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;

  SignUpBloc({required this.userRepository}) : super(SignUpInitial()) {
    on<SignUpRequested>((event, state) async {
      emit(SignUpLoading());
      try {
        await userRepository.signUp(
          name: event.name,
          password: event.password,
          email: event.email,
        );
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpError(e.toString()));
      }
    });
  }
}
