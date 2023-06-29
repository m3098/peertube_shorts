import 'package:flutter/material.dart';
import 'package:peertube_shorts/features/navigation/widgets/widgets.dart';

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
