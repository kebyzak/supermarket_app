import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket_app/generated/l10n.dart';
import 'package:supermarket_app/presentation/bloc/signup/signup_bloc.dart';
import 'package:supermarket_app/presentation/screens/auth/signin_screen.dart';
import 'package:supermarket_app/presentation/widgets/app_button.dart';
import 'package:supermarket_app/presentation/widgets/auth_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

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
                  S.of(context).welcomeLetsGo,
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
                    controller: _nameController,
                    hintText: S.of(context).name,
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
                    text: S.of(context).signUp,
                    onPressed: () {
                      BlocProvider.of<SignUpBloc>(context).add(
                        SignUpRequested(
                          email: _emailController.text,
                          password: _passwordController.text,
                          name: _nameController.text,
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
                      S.of(context).alreadyHaveAnAccount,
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
                                const SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        S.of(context).logIn,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                BlocListener<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const SignInScreen(),
                        ),
                      );
                    } else if (state is SignUpError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    } else if (state is SignUpLoading) {
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
