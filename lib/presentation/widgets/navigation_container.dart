import 'package:flutter/material.dart';

class NavigationContainer extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  final Color color;

  const NavigationContainer({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
