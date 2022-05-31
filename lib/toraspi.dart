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

class raspi {
  String path = 'https://b9ae-84-78-249-140.eu.ngrok.io';

  void sendRaspi(String text) async {
    final response = await http.post(
      Uri.parse(path + '/print'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'text': text,
      }),
    );
    if (response.statusCode == 200) {
      print("/print");
      print("Response OK");
    } else {
      print(response.statusCode.toString());
      print(response.body.toString());
    }
  }

  void scanRaspi() async {
    final response = await http.get(
      Uri.parse(path + '/scan'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print("/scan");
      print("Response OK");
    } else {
      print(response.statusCode.toString());
      print(response.body.toString());
    }
  }

  Future<String> transRaspi(String text) async {
    final response = await http.post(
      Uri.parse(path + '/translate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'text': text,
      }),
    );
    print(text);

    String res = "";
    if (response.statusCode == 200) {
      print("/translate");
      print("Response OK");
      res = response.body;
      print(res);
      print(res.runtimeType);
    } else {
      print(response.statusCode.toString());
      print(response.body.toString());
    }
    return res;
  }
}
