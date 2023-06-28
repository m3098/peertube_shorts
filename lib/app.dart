import 'package:flutter/material.dart';
import 'features/features.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Peertube Shorts",
      theme: ThemeData.dark(),
      routes: {"/": (context) => NavigationScreen()},
      initialRoute: "/",
    );
  }
}
