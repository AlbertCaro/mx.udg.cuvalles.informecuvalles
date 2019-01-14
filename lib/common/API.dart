import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = "http://148.202.232.76:8080/";

class API {
  static Future getMessages() async {
    var url = baseUrl + "api/mensajes/";
    http.Response response = await http.get(url);

    if (response.statusCode < 200 || response.statusCode > 300) {
      throw new Exception('Petición http fallida');
    } else {
      return json.decode(response.body);
    }
    
  }
}