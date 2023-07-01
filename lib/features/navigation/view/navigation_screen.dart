import 'package:flutter/material.dart';
import 'view.dart';
import '../widgets/widgets.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentScreeen = 0;
  List<Widget> _screens = [
    HomeScreen(),
    DiscoverScreen(),
    UploadScreen(),
    InboxScreen(),
    AccountScreen()
  ];

  final List<String> _titles = [
    "videos.redeyes.site",
    "Discover",
    "",
    "Inbox",
    "Account_Name"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: _currentScreeen == 0,
      extendBodyBehindAppBar: _currentScreeen == 0,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(_titles[_currentScreeen]),
      ),
      body: _screens[_currentScreeen],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        currentIndex: _currentScreeen,
        onTap: (index) => setState(() {
          _currentScreeen = index;

          if (_currentScreeen >= 2) {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return AuthPopup();
              },
            );
          }
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
