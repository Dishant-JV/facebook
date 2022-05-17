import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewDemo extends StatefulWidget {
  const WebviewDemo({Key? key}) : super(key: key);

  @override
  _WebviewDemoState createState() => _WebviewDemoState();
}

class _WebviewDemoState extends State<WebviewDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(' Disable JavaScript in WebView ')),
        body: WebView(
          initialUrl: 'https://pub.dev/packages/webview_flutter/example',
          zoomEnabled: true,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
