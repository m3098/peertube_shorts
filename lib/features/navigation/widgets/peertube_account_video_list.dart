import 'package:flutter/material.dart';

class PeertubeAccountVideoList extends StatelessWidget {
  const PeertubeAccountVideoList({
    super.key,
    required this.colors,
  });

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: colors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              color: colors[index],
              margin: const EdgeInsets.all(2.0),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("123.3"),
            ),
          ],
        );
      },
    );
  }
}
