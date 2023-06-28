import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.login,
          size: 70,
        ),
        Text("Create account"),
        SizedBox(
          height: 10,
        ),
        FilledButton(onPressed: () {}, child: Text("Sign up"))
      ],
    ));
  }
}
