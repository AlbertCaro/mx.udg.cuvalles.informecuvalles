import 'package:flutter/material.dart';
import 'live.dart';
import 'messages.dart';
import 'web.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informe CUValles',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color(0xFF0063AD),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  final String title = "Informe CUValles";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [
    WebTab(),
    LiveTab(),
    MessagesTab()
  ];

  void onTapTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color(0xFF78b41e),
        type: BottomNavigationBarType.fixed,
        onTap: onTapTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.web),
              title: Text('Web')
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.fiber_manual_record),
            title: new Text('En vivo'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Mensajes'),
          ),
        ],
      ),
    );
  }
}
