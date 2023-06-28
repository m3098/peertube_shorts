import 'package:flutter/material.dart';

class PeertubeAccountHeader extends StatelessWidget {
  const PeertubeAccountHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            border: Border.all(width: 5.0, color: Colors.white),
            shape: BoxShape.circle,
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage("https://loremflickr.com/720/1080?99"),
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 8),
            Text(
              "@qwe_543534ccc",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "12.3k subs",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(onPressed: () {}, child: const Text("Subscribe")),
                const SizedBox(width: 8),
                FilledButton(
                    onPressed: () {}, child: const Icon(Icons.favorite)),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
                "My best channel eqrferwgwr rt r wt wr we gwe ger etewqrwf wqeqweqw "),
            const SizedBox(height: 16),
          ],
        )
      ],
    );
  }
}
