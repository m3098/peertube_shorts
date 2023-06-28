import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              title: Text('meme$index'),
              subtitle: Text('poular tag'),
              leading: Icon(
                Icons.g_mobiledata,
                size: 50,
              ),
              trailing: Icon(Icons.arrow_right),
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      color: Colors.red,
                      height: 160,
                      width: 90,
                      child: Center(child: Text("$index")),
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
