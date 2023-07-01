import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/navigation_screen_bloc/bloc/navigation_screen_bloc.dart';
import 'view.dart';
import '../widgets/widgets.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationScreenBloc navigationScreenBloc =
        BlocProvider.of<NavigationScreenBloc>(context);
    final List<String> _titles = [
      "videos.redeyes.site",
      "Discover",
      "",
      "Inbox",
      "Account_Name"
    ];

    return BlocBuilder<NavigationScreenBloc, NavigationScreenState>(
      builder: (context, state) {
        if (state is NavigationScreenInitial) {
          return Scaffold(
            extendBody: state.currentScreen is HomeScreen,
            extendBodyBehindAppBar: state.currentScreen is HomeScreen,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(_titles[state.screenIndex]),
            ),
            body: state.currentScreen,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              backgroundColor: Colors.transparent,
              currentIndex: state.screenIndex,
              onTap: (index) => navigationScreenBloc.add(ChangeScreen(index)),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Discover',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mail),
                  label: 'Inbox',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Account',
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
