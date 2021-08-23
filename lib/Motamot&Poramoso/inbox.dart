import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class InBox extends StatefulWidget {
  const InBox({Key? key}) : super(key: key);
  @override
  _InBoxState createState() => _InBoxState();
}

class _InBoxState extends State<InBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,
      body: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(42.0),
          child: AppBar(
            backgroundColor: Colors.teal[600],
            title: Text("মতামত ও পরামর্শ",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: false,
          ),
        ),

        body: WebView(
          initialUrl:'https://news.jomakhoroc.com/feedback-and-suggestions/' ,
          javascriptMode: JavascriptMode.unrestricted,
        ),

      ),

    );
  }
}