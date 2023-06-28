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
                PeertubeAccountVideoList(),
              ],
            ),
          )
        : const AuthScreen();
  }
}
