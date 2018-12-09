import 'package:flutter/material.dart';

class MessagesTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListState();
  }

}

class ListState extends State<MessagesTab> {

  List<Message> messages = [
    new Message('Alberto Caro', 'gadsgdasgadsgasadsfasdfasgdadsgasdgasdgsadgadsgsasgdasdgadsgasdgasgd')
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        reverse: true,
        itemBuilder: (_,int index) => ItemList(this.messages[index]),
        itemCount: this.messages.length,
      ),
    );
  }

}

class ItemList extends StatelessWidget {
  final Message message;
  ItemList(this.message);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(child: new Text(message.subject[0])),
            Padding(padding: EdgeInsets.only(right: 10.0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text(message.subject, style: TextStyle(fontSize: 18.0), textAlign: TextAlign.left,),
              Text(message.content, style: TextStyle(fontSize: 12.0))
            ],)
          ],
        ),
      ),
    );
  }

}

class Message {
  String subject, content;
  Message(this.subject, this.content);
}