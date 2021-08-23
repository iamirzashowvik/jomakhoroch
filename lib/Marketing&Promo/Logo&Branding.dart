import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class MarketingLogo extends StatefulWidget {
  const MarketingLogo({Key? key}) : super(key: key);
  @override
  _InBoxState createState() => _InBoxState();
}


class _InBoxState extends State<MarketingLogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(42.0),
          child: AppBar(
            backgroundColor: Colors.teal[600],
            title: Text("লোগো ও ব্রান্ডিং",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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

