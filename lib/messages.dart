import 'package:flutter/material.dart';
import 'package:informe_cuvalles/model/Message.dart';
import 'common/API.dart';

import 'constants.dart';

class MessagesTab extends StatefulWidget {
  @override
  ListState createState() => ListState();
}

class ListState extends State<MessagesTab> {

  List<Message> messages = [];

  Widget child = Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_TITLE),
      ),
      body: Container(
        color: LIST_BACKGROUND_COLOR,
        child: child,
      )
    );
  }

  @override
  void initState() {
    super.initState();
    loadMessages();
  }

  void loadMessages() {
    child = Center(child: CircularProgressIndicator());
    setState(() {});
    API.getMessages().then((iterable) {
      print("Response: "+iterable);
      messages = iterable.map((model) => Message.fromJson(model)).toList();
      child = ListView.builder(
                reverse: true,
                itemBuilder: (_,int index) => ItemList(this.messages[index]),
                itemCount: this.messages.length,
              );
      setState(() {});
    }).catchError((error) {
      print(error);
      child = Center(child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  Icon(
                    Icons.wifi_lock,
                    color: Colors.black54,
                    size: 160,
                  ),
                  Padding(padding: EdgeInsets.only(top: 16.0),),
                  Text('No se pudo obtener los mensajes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Text('Revise su conexión a internet'),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  MaterialButton(
                    child: Text('Reintentar'),
                    textColor: ACCENT_COLOR,
                    onPressed: loadMessages,
                    )
                ]),
              );
      setState(() {});
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

