import 'package:flutter/material.dart';

class PeertubeVideoPlayer extends StatelessWidget {
  const PeertubeVideoPlayer({
    super.key,
    required String video,
  }) : _video = video;

  final String _video;

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.network(_video));
  }
}
