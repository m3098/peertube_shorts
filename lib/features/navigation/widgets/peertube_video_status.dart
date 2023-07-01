import 'package:flutter/material.dart';
import "widgets.dart";
import '../../../services/services.dart';

class PeertubeVideoStatus extends StatelessWidget {
  final String avatarUrl;
  final int numberOfLikes;
  final int numberOfComments;

  const PeertubeVideoStatus(
      {super.key,
      required this.avatarUrl,
      required this.numberOfLikes,
      required this.numberOfComments});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PeertubeVideoAvatar(avatarUrl: avatarUrl),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  size: 30,
                )),
            Text(
              ConvertNumber.convertNumber(numberOfLikes),
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        SizedBox(
          height: 10,
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
              ConvertNumber.convertNumber(numberOfComments),
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        SizedBox(
          height: 10,
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
