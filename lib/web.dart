import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
        url: "http://google.com" // TODO: Cambiar URL
    );
  }

}