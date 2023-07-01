import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertube_shorts/features/navigation/blocs/navigation_screen_bloc/bloc/navigation_screen_bloc.dart';
import 'package:peertube_shorts/theme/peertube_theme.dart';
import 'features/features.dart';
import 'features/navigation/blocs/home_screen_bloc/bloc/home_screen_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationScreenBloc>(
          create: (context) => NavigationScreenBloc(),
        )
      ],
      child: MaterialApp(
        title: "Peertube Shorts",
        theme: PeertubeTheme.darkTheme,
        routes: {"/": (context) => NavigationScreen()},
        initialRoute: "/",
      ),
    );
  }
}
