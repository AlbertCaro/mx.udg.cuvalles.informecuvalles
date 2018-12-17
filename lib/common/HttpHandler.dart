import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:informe_cuvalles/model/Message.dart';

class HttpHandler{

  Future<dynamic> getJson(Uri uri) async{

    http.Response response = await http.get(uri);

    return json.decode(response.body).toString();
  }

  Future<String> obtenerMensajes(){
    var uri = Uri.http("https://randomuser.me/api/?results=2","",{});

    return getJson(uri).then((data)=> data.toString());

  }

}