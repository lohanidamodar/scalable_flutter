import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scalable_flutter/features/login_screen/login_screen.dart';

typedef OnSignupCallback = FutureOr<void> Function(
    String name, String email, String password);

class SignupScreen extends StatefulWidget {
  static const String routeName = 'signup';
  static const String routeLocation = '/$routeName';
  const SignupScreen({
    super.key,
    required this.onGotoLogin,
    required this.onSignup,
  });

  final VoidCallback onGotoLogin;
  final OnSignupCallback onSignup;

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(32.0),
        children: [
          const Text('Signup'),
          const SizedBox(height: 20),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          const SizedBox(height: 10),
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
              widget.onSignup(_nameController.text, _emailController.text, _passwordController.text);
            },
            child: const Text('Signup'),
          ),
          const SizedBox(height: 10.0),
          TextButton(
            onPressed: widget.onGotoLogin,
            child: Text('Already registered, login'),
          ),
        ],
      ),
    );
  }
}
