part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final User user;

  ProfileSuccess({required this.user});
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});
}

class ProfileSignedOut extends ProfileState {}
