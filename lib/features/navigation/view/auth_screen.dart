import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.login,
          size: 70,
        ),
        const Text("Create account"),
        const SizedBox(
          height: 10,
        ),
        FilledButton(onPressed: () {}, child: const Text("Sign up"))
      ],
    ));
  }
}
