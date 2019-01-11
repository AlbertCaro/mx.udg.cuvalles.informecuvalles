import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: "http://www.cuvalles.udg.mx/informe2018/"
    );
  }

}