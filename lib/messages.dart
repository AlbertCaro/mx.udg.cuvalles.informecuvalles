import 'package:flutter/material.dart';

class MessagesTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListState();
  }

}

class ListState extends State<MessagesTab> {
  List<String> Messages = [
    'Mensaje 1', 'Mensaje 2', 'Mensaje 3'
  ];
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        reverse: true,
        itemBuilder: (_,int index) => ItemList(this.Messages[index]),
        itemCount: this.Messages.length,
      ),
    );
  }

}

class ItemList extends StatelessWidget {
  final String message;
  ItemList(this.message);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            new CircleAvatar(child: new Text(message[0]),),
            new Padding(padding: EdgeInsets.only(right: 10.0)),
            new Text(message, style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }

}