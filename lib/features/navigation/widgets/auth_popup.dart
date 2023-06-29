import 'package:flutter/material.dart';
import 'widgets.dart';

class AuthPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
          child: Column(
        children: [
          Text(
            "Sign In",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          LoginForm(),
        ],
      )),
    );
  }
}
