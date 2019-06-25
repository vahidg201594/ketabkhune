import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewPdf extends StatelessWidget {
  final String bookname;
  final int index;
  final String url;
  ViewPdf(this.bookname, this.index,this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: url,
              ),
            )
          ],
        ));
  }
}
