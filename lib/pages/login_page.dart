import 'package:berry_club/components/ImageButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/CustomTextField.dart';
import '../services/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Icon(Icons.lock, size: 100),
                const SizedBox(height: 40),
                const Text('Sign in below'),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: usernameController, hintText: 'Email', obscureText: false),
                CustomTextField(
                    controller: passwordController, hintText: 'Password', obscureText: true),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [Text('Forgot Password?')]),
                const SizedBox(height: 40),
                FilledButton(
                    onPressed: () =>
                        AuthService().signInUser(usernameController.text, passwordController.text),
                    child: const Text('Sign In')),
                const SizedBox(height: 40),
                const Divider(thickness: 2),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                        onPressed: () => AuthService().signInWithGoogle(),
                        child: Text('Sign In With Google')),
                    const SizedBox(width: 10),
                    FilledButton(
                        onPressed: () => AuthService().signInWithGoogle(),
                        child: Text('Sign In With Apple'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
