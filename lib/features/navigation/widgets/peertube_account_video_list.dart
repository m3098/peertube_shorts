import 'package:flutter/material.dart';

class PeertubeAccountVideoList extends StatelessWidget {
  PeertubeAccountVideoList({
    super.key,
  });

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.blue,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
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
