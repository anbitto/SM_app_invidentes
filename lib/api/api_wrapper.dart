import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import "package:convert/convert.dart" show latinArabic;
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';

class ApiWrapper {
  final player = AudioPlayer();

  void stopPlayer() {
    player.stop();
  }

  Future<String> getFrase() async {
    String datafile = await rootBundle.loadString('frases/frase.txt');
    return datafile;
  }

  Future<File> writeMP3(String data) async {
    final file = await File('audio/decoded.mp3');

    // Write the file
    return file.writeAsString(data);
  }

  void ttsApiCall(String textInput, bool readFromFile) async {
    var frase = "";
    if (readFromFile == true) {
      frase = await getFrase();
    } else {
      frase = textInput;
    }

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

    print(user);

    var str = json.encode(user);
    print(str);

    http.Response response = await http.post(
      Uri.parse(
          'https://texttospeech.googleapis.com/v1/text:synthesize?key=AIzaSyAKame4JnmCtac6GazF_aUv5GZpsjCbpPE'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      print("Response OK");
      print(response.body.toString());

      var jsonResponse = json.decode(response.body);
      var encoded = jsonResponse["audioContent"];

      // Codec<String, String> stringToBase64Url = latinArabic.fuse(base64Url);
      // //String encoded = stringToBase64Url.encode(credentials);      // dXNlcm5hbWU6cGFzc3dvcmQ=
      // // var decoded = stringToBase64Url.decode(encoded);
      // var x = base64Url.decode(encoded);
      // var decoded = latinArabic.decode(x);

      final nose = base64Decode(encoded);
      final tempFilePath = await createTemporaryFileFromUint8List(nose);
      playAudioFromFilePath(tempFilePath);

      // writeMP3(decoded);

    } else {
      print(response.statusCode.toString());
      print(response.body.toString());
    }
  }

  Future<String> createTemporaryFileFromUint8List(Uint8List bytes) async {
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/temp.mp3').create();
    file.writeAsBytesSync(bytes);
    return file.path;
  }

  void playAudioFromFilePath(String path) async {
    try {
      await player.play(path, isLocal: true);
    } catch (e) {
      print("error al reporducir audio: ${e.toString()}");
    }
  }
}

// class ApiWrapperApp extends StatelessWidget {
//   const ApiWrapperApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'App invidentes',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Home Page'),
//     );
//   }
// }

class ApiWrapperUI extends StatefulWidget {
  const ApiWrapperUI({Key? key}) : super(key: key);

  @override
  State<ApiWrapperUI> createState() => _ApiWrapperAppState();
}

class _ApiWrapperAppState extends State<ApiWrapperUI> {
  final player = AudioPlayer();

  Future<String> getFrase() async {
    String datafile = await rootBundle.loadString('textos/frase.txt');
    return datafile;
  }

  Future<File> writeMP3(String data) async {
    final file = await File('audio/decoded.mp3');

    // Write the file
    return file.writeAsString(data);
  }

  void TTSApiCall() async {
    var frase = await getFrase();

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

    print(user);

    var str = json.encode(user);
    print(str);

    http.Response response = await http.post(
      Uri.parse(
          'https://texttospeech.googleapis.com/v1/text:synthesize?key=AIzaSyAKame4JnmCtac6GazF_aUv5GZpsjCbpPE'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      print("Response OK");
      print(response.body.toString());

      var jsonResponse = json.decode(response.body);
      var encoded = jsonResponse["audioContent"];

      // Codec<String, String> stringToBase64Url = latinArabic.fuse(base64Url);
      // //String encoded = stringToBase64Url.encode(credentials);      // dXNlcm5hbWU6cGFzc3dvcmQ=
      // // var decoded = stringToBase64Url.decode(encoded);
      // var x = base64Url.decode(encoded);
      // var decoded = latinArabic.decode(x);

      final nose = base64Decode(encoded);
      final tempFilePath = await createTemporaryFileFromUint8List(nose);
      playAudioFromFilePath(tempFilePath);

      // writeMP3(decoded);

    } else {
      print(response.statusCode.toString());
      print(response.body.toString());
    }
  }

  Future<String> createTemporaryFileFromUint8List(Uint8List bytes) async {
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/temp.mp3').create();
    file.writeAsBytesSync(bytes);
    return file.path;
  }

  void playAudioFromFilePath(String path) async {
    try {
      await player.play(path, isLocal: true);
    } catch (e) {
      print("error al reporducir audio: ${e.toString()}");
    }
  }

  void stopPlayer() {
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('audiotest'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(onPressed: TTSApiCall, child: const Text('Play')),
          ElevatedButton(onPressed: stopPlayer, child: const Text('Stop'))
        ],
      )),
    );
  }
}
