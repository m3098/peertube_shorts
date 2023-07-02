import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

import '../../../../../repositories/peertube/models/peertube_video_model.dart';
import '../../../../../repositories/peertube/peertube_repository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final PeertubeRepository peertubeRepository = PeertubeRepository();
  List<ChewieController> _chewieControllers = [];

  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<LoadVideoList>((event, emit) async {
      emit(HomeLoading());

      try {
        final videoList = await peertubeRepository.getVideoList(count: 5);

        await Future.forEach(videoList, (video) async {
          final controller = ChewieController(
              videoPlayerController:
                  VideoPlayerController.network(video.playlistUrl),
              autoInitialize: true,
              autoPlay: true,
              looping: true,
              showControls: false);

          _chewieControllers.add(controller);
        });
        emit(HomeLoaded(
            videoList: videoList, chewieControllers: _chewieControllers));
      } catch (e) {
        print(e);
        emit(HomeLoadingFailed(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
    on<AddVideo>((event, emit) async {
      final videoList = await peertubeRepository.getVideoList(
          start: _chewieControllers.length, count: 5);
      await Future.forEach(videoList, (video) async {
        final controller = ChewieController(
            videoPlayerController:
                VideoPlayerController.network(video.playlistUrl),
            autoInitialize: true,
            autoPlay: true,
            looping: true,
            showControls: false);

        _chewieControllers.add(controller);
      });
      emit(HomeLoaded(
          videoList: videoList, chewieControllers: _chewieControllers));
    });
  }
}
