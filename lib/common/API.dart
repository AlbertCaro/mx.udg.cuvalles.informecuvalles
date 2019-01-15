import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:informe_cuvalles/constants.dart';

class API {
  static Future getMessages() async {
    var url = SERVER_URL + "api/mensajes/";
    http.Response response = await http.get(url);

    if (response.statusCode < 200 || response.statusCode > 300) {
      throw new Exception('Petición http fallida');
    } else {
      return json.decode(response.body);
    }
    
  }
}