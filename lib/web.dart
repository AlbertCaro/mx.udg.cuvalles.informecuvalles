import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'constants.dart';

class WebTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: HOME_WEBVIEW_URL
    );
  }

}