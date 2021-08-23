import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MarketingSMS extends StatefulWidget {
  const MarketingSMS({Key? key}) : super(key: key);
  @override
  _InBoxState createState() => _InBoxState();
}

class _InBoxState extends State<MarketingSMS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,
      body: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(42.0),
          child: AppBar(
            backgroundColor: Colors.teal[600],
            title: Text("এসএমএস মার্কেটিং",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: false,
          ),
        ),

        body: WebView(
          initialUrl:'https://news.jomakhoroc.com/marketing/' ,

          javascriptMode: JavascriptMode.unrestricted,
        ),

      ),

    );
  }
}
//MarketingSMS
//এসএমএস মার্কেটিং
