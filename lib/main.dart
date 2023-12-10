import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supermarket_app/data/services/product_repository.dart';
import 'package:supermarket_app/data/services/user_repository.dart';
import 'package:supermarket_app/firebase_options.dart';
import 'package:supermarket_app/generated/l10n.dart';
import 'package:supermarket_app/presentation/bloc/product/product_bloc.dart';
import 'package:supermarket_app/presentation/bloc/profile/profile_bloc.dart';
import 'package:supermarket_app/presentation/bloc/qr/qr_bloc.dart';
import 'package:supermarket_app/presentation/bloc/signin/signin_bloc.dart';
import 'package:supermarket_app/presentation/bloc/signup/signup_bloc.dart';
import 'package:supermarket_app/presentation/widgets/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    RepositoryProvider<UserRepository>(
      create: (context) => UserRepository(prefs),
      child: MainApp(prefs: prefs),
    ),
  );
}

class MainApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MainApp({required this.prefs, super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository(prefs);
    final productRepository = ProductRepository(Dio());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) =>
              ProductBloc(productRepository: productRepository),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            userRepository: UserRepository(prefs),
          ),
        ),
        BlocProvider(
          create: (context) => QrBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const SplashScreen(),
      ),
    );
  }
}
