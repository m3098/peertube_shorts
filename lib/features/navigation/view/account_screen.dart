import 'package:flutter/material.dart';
import 'view.dart';
import '../widgets/widgets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isLogin = true;
  bool isVisible = true;

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
    return isLogin
        ? SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: PeertubeAccountHeader(),
                ),
                PeertubeAccountVideoList(colors: colors),
              ],
            ),
          )
        : const AuthScreen();
  }
}
