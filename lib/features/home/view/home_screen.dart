import 'package:flutter/material.dart';

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

class PeertubeVideoSubtitle extends StatelessWidget {
  const PeertubeVideoSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ZXC_dubstep_PHONKER",
            style: Theme.of(context).textTheme.labelLarge),
        Text(lorem,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}

class PeertubeVideoStatus extends StatelessWidget {
  const PeertubeVideoStatus({
    super.key,
    required String avatarUrl,
  }) : _avatarUrl = avatarUrl;

  final String _avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PeertubeVideoAvatar(avatarUrl: _avatarUrl),
        Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  size: 30,
                )),
            Text(
              "123,3",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mail,
                  size: 30,
                )),
            Text(
              "123,3",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: 30,
            )),
      ],
    );
  }
}

class PeertubeVideoAvatar extends StatelessWidget {
  const PeertubeVideoAvatar({
    super.key,
    required String avatarUrl,
  }) : _avatarUrl = avatarUrl;

  final String _avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 60,
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.white),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(_avatarUrl),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
          height: 20,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add, size: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

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

String lorem =
    "Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.. Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам lorem ipsum сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).";
