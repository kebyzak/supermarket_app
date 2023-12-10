part of 'signup_bloc.dart';

abstract class SignUpEvent {}

class SignUpRequested extends SignUpEvent {
  final String email;
  final String name;
  final String password;

  SignUpRequested({
    required this.email,
    required this.name,
    required this.password,
  });
}
