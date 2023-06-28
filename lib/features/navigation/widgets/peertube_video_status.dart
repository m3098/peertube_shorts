import 'package:flutter/material.dart';
import "widgets.dart";

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
