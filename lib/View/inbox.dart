import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: Colors.teal[600],
            title: Text('নোটিফিকেশন',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: false,
          ),
        ),
        //Text('নোটিফিকেশন'),

        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(Icons.notification_important_rounded,
                    size: 160.0, color: Colors.black
                ),
                Text(
                    'No Item available to Show', style: TextStyle(fontSize: 22)
                ),
                Text('The items will be shown here',
                    style: TextStyle(color: Colors.black)
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
