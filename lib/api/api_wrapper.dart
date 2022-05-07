import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiWrapper {
  // static ApiWrapper _instance;

  // ApiWrapper._internal() {
  //   _instance = this;
  // }

  // factory ApiWrapper() => _instance ?? ApiWrapper._internal();

  final String endpoint = "texttospeech.googleapis.com";

  final String route =
      "v1/text:synthesize?key=AIzaSyAKame4JnmCtac6GazF_aUv5GZpsjCbpPE";

  // http.Response response =
  //     await http.get(Uri.http(endpoint, api), headers: <String, String>{
  //   'x-auth-token': authToken,
  // });

  Future<String> getFrase() async {
    String datafile = await rootBundle.loadString('frases/frase.txt');
    return datafile;
  }

  Future<File> writeMP3(String data) async {
    final file = await File('audio/decoded.mp3');

    // Write the file
    return file.writeAsString(data);
  }

  Future<String> TTSApiCall(String file_path) async {
    var frase = getFrase();
    print(endpoint + route);

    var user = {};

    var resBody = {};
    resBody["languageCode"] = "es-ES";
    resBody["name"] = "es-ES-Standard-A";
    resBody["ssmlGender"] = "FEMALE";
    user["voice"] = resBody;

    resBody = {};
    resBody["text"] = frase;
    user["input"] = resBody;

    resBody = {};
    resBody["audioEncoding"] = "MP3";
    user["audioConfig"] = resBody;

    var str = json.encode(user);
    print(str);

    http.Response response = await http.post(
      Uri.http(endpoint, route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(<String, <String, String>>{
      //   "input": {"text": frase},
      //   "voice": {
      //     "languageCode": "es-ES",
      //     // "name": "en-GB-Standard-A",
      //     "name": "es-ES-Standard-A",
      //     "ssmlGender": "FEMALE"
      //   },
      //   "audioConfig": {"audioEncoding": "MP3"}
      // }),
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      print("usuario registrado");
      print(response.body.toString());
      var token = response.body.toString();
      print('token:$token');
      Iterable l = json.decode(response.body);
      var encoded = l.first;
      // var prods = List<Product>.from(l = Product.fromJson(model)));
      // String credentials = "username:password";
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      // String encoded = stringToBase64.encode(credentials);      // dXNlcm5hbWU6cGFzc3dvcmQ=
      String decoded = stringToBase64.decode(encoded);
      writeMP3(decoded);

      return decoded;
    } else {
      print(response.statusCode.toString());
      print(response.body.toString());
      return "Error";
    }
  }
}
