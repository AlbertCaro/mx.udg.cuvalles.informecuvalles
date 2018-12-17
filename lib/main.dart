import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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
        primaryColor: Color(0xFF0063AD),
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
  final FirebaseMessaging _messaging = FirebaseMessaging();

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
        fixedColor: Color(0xFF78b41e),
        type: BottomNavigationBarType.fixed,
        onTap: onTapTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.web),
              title: Text('Web')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_manual_record),
            title: Text('En vivo'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Mensajes'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _messaging.requestNotificationPermissions();
    _messaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print(message['notification']);
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
      },
    );
    _messaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _messaging.getToken().then((token) {
      print("token: "+token);
    });
  }
}
