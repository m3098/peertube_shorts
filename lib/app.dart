import 'package:flutter/material.dart';
import 'package:peertube_shorts/theme/peertube_theme.dart';
import 'features/features.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Peertube Shorts",
      theme: PeertubeTheme.darkTheme,
      routes: {"/": (context) => NavigationScreen()},
      initialRoute: "/",
    );
  }
}
