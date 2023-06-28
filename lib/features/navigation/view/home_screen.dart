import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final List<String> _videos = [
    "https://loremflickr.com/720/1080?1",
    "https://loremflickr.com/720/1080?2",
    "https://loremflickr.com/1080/720?3",
    "https://loremflickr.com/720/720?4",
    "https://loremflickr.com/720/1080?5",
    "https://loremflickr.com/720/1080?6",
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _videos.length,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            PeertubeVideoPlayer(video: _videos[index]),
            Align(
              alignment: Alignment.centerRight,
              child: PeertubeVideoStatus(
                  avatarUrl: _videos[_videos.length - 1 - index]),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 100),
              child: PeertubeVideoSubtitle(),
            ),
          ],
        );
      },
    );
  }
}
