import 'package:flutter/material.dart';

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
            child: const Icon(Icons.add, size: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
