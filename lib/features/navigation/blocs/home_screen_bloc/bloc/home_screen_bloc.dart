import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

import '../../../../../repositories/peertube/models/peertube_video_model.dart';
import '../../../../../repositories/peertube/peertube_repository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final PeertubeRepository peertubeRepository = PeertubeRepository();

  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<LoadVideoList>((event, emit) async {
      emit(HomeLoading());

      try {
        final videoList = await peertubeRepository.getVideoList(count: 10);

        final chewieControllers = buildChewieControllers(videoList);

        emit(HomeLoaded(
          videoList: videoList,
          chewieControllers: chewieControllers,
        ));
      } catch (e) {
        print(e);
        emit(HomeLoadingFailed(exception: e));
      } finally {
        event.completer?.complete();
      }
    });

    on<AddVideo>((event, emit) async {
      final videoList = await peertubeRepository.getVideoList(
        start: event.startIndex,
        count: 10,
      );

      final chewieControllers = buildChewieControllers(videoList);

      emit(HomeLoaded(
        videoList: videoList,
        chewieControllers: chewieControllers,
      ));
    });
  }

  List<ChewieController> buildChewieControllers(
      List<PeertubeVideoModel> videoList) {
    return videoList.map((video) {
      final videoPlayerController =
          VideoPlayerController.network(video.playlistUrl);
      return ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        autoInitialize: true,
        looping: true,
        showControls: false,
      )..pause();
    }).toList();
  }
}
