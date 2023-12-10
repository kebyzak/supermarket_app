// profile_screen.dart
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket_app/data/services/user_repository.dart';
import 'package:supermarket_app/generated/l10n.dart';
import 'package:supermarket_app/presentation/bloc/profile/profile_bloc.dart';
import 'package:supermarket_app/presentation/screens/auth/signin_screen.dart';
import 'package:supermarket_app/presentation/widgets/app_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = RepositoryProvider.of<UserRepository>(context);

    return BlocProvider(
      create: (context) => ProfileBloc(userRepository: userRepository),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileInitial) {
            BlocProvider.of<ProfileBloc>(context).loadProfile();
            return const CircularProgressIndicator();
          } else if (state is ProfileLoading) {
            return const CircularProgressIndicator();
          } else if (state is ProfileSuccess) {
            final email = state.user.email;
            final name = state.user.displayName;
            final userRepository = profileBloc.userRepository;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).nameName(name.toString()),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  S.of(context).emailEmail(email.toString()),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                AppButton(
                  text: S.of(context).signOut,
                  onPressed: () async {
                    await userRepository.signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                )
              ],
            );
          } else if (state is ProfileError) {
            return Text('Error: ${state.error}');
          } else if (state is ProfileSignedOut) {
            return const Text('User signed out');
          } else {
            return const Text('Unknown state');
          }
        },
      ),
    );
  }
}
