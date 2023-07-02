part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent extends Equatable {}

class LoadVideoList extends HomeScreenEvent {
  final Completer? completer;

  LoadVideoList({this.completer});

  @override
  List<Object?> get props => [completer];
}

class AddVideo extends HomeScreenEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
