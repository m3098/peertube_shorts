part of 'navigation_screen_bloc.dart';

@immutable
abstract class NavigationScreenState {}

class NavigationScreenInitial extends NavigationScreenState {
  final Widget currentScreen;
  final int screenIndex;

  NavigationScreenInitial(
      {required this.currentScreen, required this.screenIndex});
}
