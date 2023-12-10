import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket_app/generated/l10n.dart';
import 'package:supermarket_app/presentation/bloc/signin/signin_bloc.dart';
import 'package:supermarket_app/presentation/screens/auth/signup_screen.dart';
import 'package:supermarket_app/presentation/screens/home_screen.dart';
import 'package:supermarket_app/presentation/widgets/app_button.dart';
import 'package:supermarket_app/presentation/widgets/auth_textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_bag, size: 100),
                Text(
                  S.of(context).market,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 50),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).welcomeBack,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AuthTextField(
                    controller: _emailController,
                    hintText: S.of(context).email,
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AuthTextField(
                    controller: _passwordController,
                    hintText: S.of(context).password,
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: AppButton(
                    text: S.of(context).signIn,
                    onPressed: () {
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInRequested(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).notAMember,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        S.of(context).registerNow,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                BlocListener<SignInBloc, SignInState>(
                  listener: (context, state) {
                    if (state is SignInSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomeScreen(),
                        ),
                      );
                    } else if (state is SignInError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    } else if (state is SignInLoading) {
                      const CircularProgressIndicator();
                    }
                  },
                  child: const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
