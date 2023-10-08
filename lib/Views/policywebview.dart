import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyWebViewPage extends StatelessWidget {
  final String url;

  const PolicyWebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Policy'),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
