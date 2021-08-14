import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CodeSnippetScreen extends StatefulWidget {
  const CodeSnippetScreen({Key? key}) : super(key: key);

  @override
  _CodeSnippetScreenState createState() => _CodeSnippetScreenState();
}

class _CodeSnippetScreenState extends State<CodeSnippetScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Code Snippet'),
      ),
      body: WebView(
        initialUrl: 'https://anfelos.com/snippets/command',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
