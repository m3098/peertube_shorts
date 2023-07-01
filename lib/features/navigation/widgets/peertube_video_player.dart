import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PeertubeVideoPlayer extends StatefulWidget {
  final ChewieController chewieController;

  PeertubeVideoPlayer({Key? key, required this.chewieController})
      : super(key: key);

  @override
  _PeertubeVideoPlayerState createState() => _PeertubeVideoPlayerState();
}

class _PeertubeVideoPlayerState extends State<PeertubeVideoPlayer> {
  late ChewieController chewieController;

  void _togglePlayPause() {
    setState(() {
      if (chewieController.isPlaying) {
        chewieController.pause();
      } else {
        chewieController.play();
      }
    });
  }

  @override
  void initState() {
    chewieController = widget.chewieController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Center(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Chewie(
                controller: chewieController,
              ),
              if (!chewieController.isPlaying)
                Icon(
                  Icons.play_arrow,
                  size: 64,
                  color: Colors.white,
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: VideoProgressIndicator(
                  chewieController.videoPlayerController,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Theme.of(context).primaryColor,
                    bufferedColor: Colors.white,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
