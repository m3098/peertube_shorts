import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peertube_shorts/repositories/peertube/models/peertube_video_model.dart';
import 'package:rive/rive.dart';
import 'package:video_player/video_player.dart';
import '../blocs/home_screen_bloc/bloc/home_screen_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        print(state.toString);
        if (state is HomeScreenInitial) {
          BlocProvider.of<HomeScreenBloc>(context).add(LoadVideoList());
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeLoaded) {
          List<PeertubeVideoModel> videos = state.videoList;
          List<ChewieController> _chewieControllers = state.chewieControllers;

          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _chewieControllers.length + 1,
            physics: PageScrollPhysics(),
            itemBuilder: (context, index) {
              if (index != _chewieControllers.length) {
                return Stack(
                  children: [
                    PeertubeVideoPlayer(
                      chewieController: _chewieControllers[index]..play(),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PeertubeVideoStatus(
                            avatarUrl: "https://loremflickr.com/720/1080?`1337",
                            numberOfLikes: 123312321,
                            numberOfComments: 2133),
                      ),
                    ),
                    PeertubeVideoSubtitle()
                  ],
                );
              } else {
                BlocProvider.of<HomeScreenBloc>(context).add(AddVideo());
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                        child: RiveAnimation.asset(
                          "assets/animations/eye.riv",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "поиск видео",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        } else if (state is HomeLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          print(state.toString());
          return Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}
