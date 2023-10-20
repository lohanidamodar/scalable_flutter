import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';
  static const String routeLocation = '/$routeName';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: const Text(
          "Loading...",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
