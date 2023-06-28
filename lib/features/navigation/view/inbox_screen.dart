import 'dart:math';

import 'package:flutter/material.dart';
import 'view.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({super.key});
  String _avatarUrl = "https://loremflickr.com/720/1080?1337";
  Random _random = Random();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return _random.nextBool()
              ? ListTile(
                  title: Text("Account_Name $index"),
                  subtitle: Text("started following you"),
                  leading: SizedBox(
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
                  trailing: FilledButton(
                    onPressed: () {},
                    child: Text("Follow back"),
                  ))
              : ListTile(
                  title: Text("Account_Name $index"),
                  subtitle: Text("liked your video"),
                  leading: SizedBox(
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
                  trailing: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.red,
                      )));
        });
  }
}
