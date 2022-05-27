import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:sm_app_invidente/globals.dart' as globals;
import 'package:http/http.dart' as http;

class text2brailleState {
  Future<List<String>> t2bApiCall() async {
    //Guardamos el texto obtenido
    var frase = globals.resultadoTexto;

    //Nos conectamos a la API de traductor a braille
    final uri = Uri.parse(
        'https://api.funtranslations.com/translate/braille/unicode.json')
        .replace(queryParameters: {
      'text': frase, //Introducimos como parametro el texto a traducir
    });
    final response = await http.get(uri); //Esperamos la respuesta

    //Creamos lista string vacía para guardar el resultado final de la traducción
    List<String> res = [];
    if (response.statusCode == 200) {
      print("Response OK"); //Para asegurarnos de que se ha recibido bien la respuesta
      var data = json.decode(response.body); //Guardamos la información recibida con la respuesta
      var trans = data["contents"]["translated"]; //Accedemos solo a la traducción a braille
      res = new List<String>.from(trans); //Pasamos la traducción a braille de lista dinámica a lista string, que es lo que devolverá esta función
    } else {
      print(response.statusCode.toString());
      print(response.body.toString());
    }
    return res;
  }
}
