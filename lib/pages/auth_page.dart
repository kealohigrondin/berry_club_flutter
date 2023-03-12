import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../app_root.dart';
import 'login_page.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AppRoot();
              } else {
                return LoginPage();
              }
            }));
  }
}
