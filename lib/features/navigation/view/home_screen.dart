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
  late PageController _pageController;
  List<String> _videoUrls = [
    'https://videos.redeyes.site/static/streaming-playlists/hls/f2f2e416-6218-47f3-8213-00894b914627/5a3846d2-fed3-4245-a1e6-862411573a6d-master.m3u8',
    'https://videos.redeyes.site/static/streaming-playlists/hls/cad18014-8d81-420d-9a35-6b432f525560/8d353a17-6c2a-4595-b17a-a4d84d1da110-master.m3u8',
    'https://videos.redeyes.site/static/streaming-playlists/hls/1927fda1-be9b-46f6-af3c-939bb1898de7/1c5f4ebc-b59e-4f8e-9c16-559b02efb400-master.m3u8',
  ];

  List<ChewieController> _chewieControllers = [];

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _initializeVideoControllers();
  }

  void _initializeVideoControllers() {
    for (String url in _videoUrls) {
      final chewieController = ChewieController(
        showControlsOnInitialize: false,
        showControls: false,
        looping: true,
        videoPlayerController: VideoPlayerController.network(url),
      );

      chewieController.videoPlayerController.initialize().then((_) {
        setState(() {
          _chewieControllers.add(chewieController);
        });
      });
    }
  }

  @override
  void dispose() {
    for (ChewieController controller in _chewieControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: _videoUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildVideoPlayer(index);
      },
    );
  }

  Widget _buildVideoPlayer(int index) {
    final chewieController = _chewieControllers[index];
    return FutureBuilder(
      future: chewieController.videoPlayerController.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text('Ошибка инициализации видеоплеера'));
          } else {
            return Stack(
              children: [
                PeertubeVideoPlayer(
                  chewieController: chewieController..play(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: PeertubeVideoStatus(
                    avatarUrl: 'https://loremflickr.com/720/1080?6',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 100),
                  child: PeertubeVideoSubtitle(),
                ),
              ],
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
