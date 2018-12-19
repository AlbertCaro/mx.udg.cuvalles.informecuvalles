import 'package:flutter/material.dart';
import 'package:informe_cuvalles/model/Message.dart';
import 'common/API.dart';
import 'dart:convert';

class MessagesTab extends StatefulWidget {
  @override
  ListState createState() => ListState();
}

class ListState extends State<MessagesTab> {

  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFf2f2f2), // Blanco un poco más gris para que resalte más la tarjeta
      child: ListView.builder(
        reverse: true,
        itemBuilder: (_,int index) => ItemList(this.messages[index]),
        itemCount: this.messages.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cargarJson();
  }

  void cargarJson() {
    API.getMessages().then((response) {
      setState(() {
        print(response.body);
        Iterable iterable = json.decode(response.body);
        messages = iterable.map((model) => Message.fromJson(model)).toList();
      });
    });
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
              backgroundImage: AssetImage('assets/images/descarga.jpg'),
            ),
            Padding(padding: EdgeInsets.only(right: 10.0)),
            Container(
              width: MediaQuery.of(context).size.width-80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message.subject,
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

