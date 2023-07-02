part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState extends Equatable {}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeScreenState {
  final List<PeertubeVideoModel> videoList;
  final List<ChewieController> chewieControllers;

  HomeLoaded({required this.chewieControllers, required this.videoList});

  @override
  List<Object?> get props => [videoList];
}

class HomeLoadingFailed extends HomeScreenState {
  final Object? exception;

  HomeLoadingFailed({required this.exception});

  @override
  List<Object?> get props => [exception];
}
