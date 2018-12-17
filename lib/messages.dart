import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

class MessagesTab extends StatefulWidget {
  @override
  ListState createState() => ListState();
}

class ListState extends State<MessagesTab> {

  List messages = new List();

  void fetchData() {
    getData().then((res) {
      setState(() {
        messages.addAll(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Messages: "+messages.toString());
    return Container(
      color: Color(0xFFf2f2f2), // Blanco un poco más gris para que resalte más la tarjeta
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
            CircleAvatar(
              // TODO: Reemplazar la imagen con lo que sea que vaya a llevar
              backgroundImage: AssetImage('assets/lord.jpg'),
            ),
            Padding(padding: EdgeInsets.only(right: 10.0)),
            Container(
              width: MediaQuery.of(context).size.width-80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "CUValles",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.left,
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.0)),
                  Text(
                    message.content,
                    style: TextStyle(fontSize: 14.0),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

Future<List> getData() async {
  var url = "https:";
  List data = new List();
  var request = await HttpClient().getUrl(Uri.parse(url));
  var response = await request.close();
  if (response.statusCode == HttpStatus.ok) {
    var jsonString = await response.transform(utf8.decoder).join();
    data = json.decode(jsonString);
    return data;
  }else{
    return data;
  }
}

class Message { // Molde para los mensajes.
  String subject, content;
  Message(this.subject, this.content);
}