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
    var frase = globals.resultadoTexto;
    //var frase = "Hello";

    var user = {};
    var str = json.encode(user);
    print(str);

    final uri = Uri.parse(
        'https://api.funtranslations.com/translate/braille/unicode.json')
        .replace(queryParameters: {
      'text': frase,
    });
    final response = await http.get(uri);

    List<String> res = [];
    if (response.statusCode == 200) {
      print("Response OK");
      var data = json.decode(response.body);
      var trans = data["contents"]["translated"];
      print(trans);
      print(trans.runtimeType);
      res = new List<String>.from(trans);
      print(res.runtimeType);
      print(res);
    } else {
      print(response.statusCode.toString());
      print(response.body.toString());
    }
    return res;
  }
}