import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../view/view.dart';

part 'navigation_screen_event.dart';
part 'navigation_screen_state.dart';

class NavigationScreenBloc
    extends Bloc<NavigationScreenEvent, NavigationScreenState> {
  static final List<Widget> _screens = [
    HomeScreen(),
    DiscoverScreen(),
    UploadScreen(),
    InboxScreen(),
    AccountScreen()
  ];

  NavigationScreenBloc()
      : super(NavigationScreenInitial(
            currentScreen: _screens[0], screenIndex: 0)) {
    on<ChangeScreen>((event, emit) => emit(NavigationScreenInitial(
        currentScreen: _screens[event.index], screenIndex: event.index)));
  }
}
