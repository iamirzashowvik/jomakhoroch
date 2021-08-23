import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Use extends StatefulWidget {
  const Use({Key? key}) : super(key: key);
  @override
  _MarketingState createState() => _MarketingState();
}

class _MarketingState extends State<Use> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,
      body: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(42.0),
          child: AppBar(
            backgroundColor: Colors.teal[600],
            title: Text('কীভাবে ব্যাবহার করবেন?',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: false,
          ),
        ),

        body: WebView(
          initialUrl:'https://news.jomakhoroc.com/how-to-use/' ,
          javascriptMode: JavascriptMode.unrestricted,
        ),

      ),
    );
  }
}