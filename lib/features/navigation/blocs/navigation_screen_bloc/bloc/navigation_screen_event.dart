part of 'navigation_screen_bloc.dart';

@immutable
abstract class NavigationScreenEvent {}

class ChangeScreen extends NavigationScreenEvent {
  final int index;

  ChangeScreen(this.index);
}
