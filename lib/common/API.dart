import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://148.202.232.76:8080/";

class API {
  static Future getMessages() {
    var url = baseUrl + "api/mensajes/";
    return http.get(url);
  }
}