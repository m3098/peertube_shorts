import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _videoUrls = [];

  List<ChewieController> _chewieControllers = [];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _initVideos([
      "https://videos.redeyes.site/static/streaming-playlists/hls/78aecfd0-4726-4856-b214-346387599e60/2738f075-7eff-4d65-8037-0e09a26757d4-master.m3u8",
      'https://videos.redeyes.site/static/streaming-playlists/hls/f2f2e416-6218-47f3-8213-00894b914627/5a3846d2-fed3-4245-a1e6-862411573a6d-master.m3u8',
      'https://videos.redeyes.site/static/streaming-playlists/hls/cad18014-8d81-420d-9a35-6b432f525560/8d353a17-6c2a-4595-b17a-a4d84d1da110-master.m3u8',
      'https://videos.redeyes.site/static/streaming-playlists/hls/1927fda1-be9b-46f6-af3c-939bb1898de7/1c5f4ebc-b59e-4f8e-9c16-559b02efb400-master.m3u8',
    ]);
  }

  void _initVideos(List<String> videoUrls) {
    videoUrls.forEach((url) {
      final controller = ChewieController(
          videoPlayerController: VideoPlayerController.network(url),
          autoInitialize: true,
          looping: true,
          showControls: false);
      _chewieControllers.add(controller);
    });
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _chewieControllers) {
      controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _chewieControllers.length,
      physics: PageScrollPhysics(),
      itemBuilder: (context, index) {
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
      },
    );
  }
}
