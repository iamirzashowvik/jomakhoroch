import 'package:flutter/material.dart';
import 'package:jomakhoroch/View/home.dart';
import 'package:jomakhoroch/View/inbox.dart';
import 'package:jomakhoroch/View/online_store.dart';
import 'package:jomakhoroch/View/tools.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _pages = [Home(), OnlineStore(), Inbox(), Tools()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.teal[600],
          color: Colors.white,
          activeColor: Colors.green[100],
          items: [
            TabItem(icon: Icon(Icons.home), title: 'হোম'),
            TabItem(icon: Icon(Icons.help), title: 'অনলাইন স্টোর '),
            TabItem(icon: Icon(Icons.message), title: 'ইনবক্স'),
            TabItem(icon: Icon(Icons.settings), title: 'টুলস'),
          ],
          onTap: (int i) {
            setState(() {
              _currentIndex = i;
            });
          },
        ),
        body: _pages[_currentIndex],
      ),
    );
  }

}
