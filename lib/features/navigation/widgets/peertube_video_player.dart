import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PeertubeVideoPlayer extends StatefulWidget {
  final ChewieController chewieController;

  const PeertubeVideoPlayer({Key? key, required this.chewieController})
      : super(key: key);

  @override
  _PeertubeVideoPlayerState createState() => _PeertubeVideoPlayerState();
}

class _PeertubeVideoPlayerState extends State<PeertubeVideoPlayer> {
  void _togglePlayPause() {
    setState(() {
      if (widget.chewieController.isPlaying) {
        widget.chewieController.pause();
      } else {
        widget.chewieController.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Expanded(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Chewie(
              controller: widget.chewieController,
            ),
            if (!widget.chewieController.isPlaying)
              Icon(
                Icons.play_arrow,
                size: 64,
                color: Colors.white,
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: VideoProgressIndicator(
                padding: EdgeInsets.only(bottom: 65),
                widget.chewieController.videoPlayerController,
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
    );
  }
}
