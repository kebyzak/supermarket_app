import 'package:flutter/material.dart';
import 'package:supermarket_app/generated/l10n.dart';
import 'package:supermarket_app/presentation/screens/products_screen.dart';
import 'package:supermarket_app/presentation/screens/profile_screen.dart';
import 'package:supermarket_app/presentation/screens/qr_screen.dart';
import 'package:supermarket_app/presentation/screens/stories_screen.dart';
import 'package:supermarket_app/presentation/widgets/navigation_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: NavigationContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const ProductsScreen(),
                            ),
                          );
                        },
                        icon: Icons.shopping_cart_rounded,
                        text: S.of(context).products,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: NavigationContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const StoriesScreen(),
                            ),
                          );
                        },
                        icon: Icons.library_books_rounded,
                        text: S.of(context).stories,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: NavigationContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const QrScreen(),
                            ),
                          );
                        },
                        icon: Icons.qr_code_2_rounded,
                        text: S.of(context).qr,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: NavigationContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const ProfileScreen(),
                            ),
                          );
                        },
                        icon: Icons.person_rounded,
                        text: S.of(context).profile,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
