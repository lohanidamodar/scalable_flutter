import 'dart:async';
import 'package:flutter/material.dart';

typedef OnLoginCallback = FutureOr<void> Function(String, String);

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';
  static const String routeLocation = '/$routeName';
  const LoginScreen({
    super.key,
    required this.onGotoSignup,
    required this.onLogin,
  });

  final VoidCallback onGotoSignup;
  final OnLoginCallback onLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(32.0),
        children: [
          const Text('Login'),
          const SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              widget.onLogin(_emailController.text, _passwordController.text);
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: widget.onGotoSignup,
            child: Text('New user, register'),
          ),
        ],
      ),
    );
  }
}
