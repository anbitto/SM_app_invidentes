import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/flutter_sound.dart';
// import 'package:google_speech/speech_client_authenticator.dart';
import 'package:google_speech/google_speech.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'dart:io';
import 'dart:async';

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sm_app_invidente/main.dart';
import 'package:sm_app_invidente/preview.dart';
import 'package:sm_app_invidente/globals.dart' as globals;

import 'package:sm_app_invidente/api/api_wrapper.dart';

import 'package:sound_recorder/sound_recorder.dart';

class voz extends StatefulWidget {
  @override
  _FusionState createState() => _FusionState();
}

class _FusionState extends State<voz> {
  bool is_Transcribing = false;
  bool is_Playing = false;
  String content = '';
  final api = ApiWrapper();
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  Future<List<int>> _getAudioContent(String name) async {
    final path = '/storage/emulated/0/Download/f1.wav';
    return File(path).readAsBytesSync().toList();
  }

  void transcribe() async {
    setState(() {
      is_Transcribing = true;
    });
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('assets/mystic-subject-349509-bc3df347265b.json'))}');
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);

    final config = RecognitionConfig(
        encoding: AudioEncoding.LINEAR16,
        model: RecognitionModel.basic,
        enableAutomaticPunctuation: true,
        sampleRateHertz: 44100,
        languageCode: 'es-ES');

    final audio = await _getAudioContent('test.wav');
    await speechToText.recognize(config, audio).then((value) {
      setState(() {
        content = value.results
            .map((e) => e.alternatives.first.transcript)
            .join('\n');
      });
    }).whenComplete(() {
      setState(() {
        is_Transcribing = false;
      });
    });
  }

  @override
  void initState() {
    setPermissions();
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();

    super.dispose();
  }

  void setPermissions() async {
    await Permission.manageExternalStorage.request();
    await Permission.storage.request();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Mic no granted';
    }
    await recorder.openRecorder();

    isRecorderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  Future record() async {
    var codecObj = Codec.pcm16WAV;
    if (!isRecorderReady) return;
    await recorder.startRecorder(
      sampleRate: 44100,
      codec: codecObj,
      toFile: '/storage/emulated/0/Download/f1.wav',
    );
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    if (!is_Transcribing) {
      transcribe();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'APP INVIDENTES',
            style:
                TextStyle(fontSize: 25.0, fontFamily: 'Glacial Indifference'),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // StreamBuilder<RecordingDisposition>(
                    //   stream: recorder.onProgress,
                    //   builder: (context, snapshot) {
                    //     final duration = snapshot.hasData
                    //         ? snapshot.data!.duration
                    //         : Duration.zero;
                    //     return Text('${duration.inSeconds} s');
                    //   },
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 1,
                      child: FloatingActionButton.extended(
                        heroTag: const Text('Dictar'),
                        label: const Text(
                          "Dictar",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        icon: const Icon(
                          Icons.mic,
                          size: 80,
                        ),
                        onPressed: () async {
                          if (recorder.isRecording) {
                            await stop();
                          } else {
                            await record();
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 200,
              //   width: 300,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   padding: EdgeInsets.all(5.0),
              //   child: content == ''
              //       ? Text(
              //           'Your text will appear here',
              //           style: TextStyle(color: Colors.grey),
              //         )
              //       : Text(
              //           content,
              //           style: TextStyle(fontSize: 20),
              //         ),
              // ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 1,
                    child: FloatingActionButton.extended(
                      heroTag: const Text('Reproducir'),
                      label: const Text(
                        "Reproducir",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      icon: const Icon(
                        // is_Playing ? Icons.stop : Icons.speaker,
                        Icons.speaker,
                        size: 70.0,
                      ),
                      onPressed: () {
                        if (!is_Playing) {
                          setState(() {
                            is_Playing = true;
                          });
                          api.ttsApiCall(content, false);
                          setState(() {
                            is_Playing = false;
                          });
                        } else {
                          api.stopPlayer();
                          setState(() {
                            is_Playing = false;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonTheme(
                    height: MediaQuery.of(context).size.height * 0.2,
                    minWidth: MediaQuery.of(context).size.width * 0.5,
                    child: RaisedButton(
                      disabledColor: Colors.grey,
                      color: Colors.red,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => MyApp(),
                          ),
                        );
                      },
                      child: const Text(
                        "Volver",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    height: MediaQuery.of(context).size.height * 0.2,
                    minWidth: MediaQuery.of(context).size.width * 0.5,
                    child: RaisedButton(
                      disabledColor: Colors.grey,
                      color: Colors.green,
                      onPressed: () {
                        // globals.resultadoTexto = "Vengo del Dictar";
                        // Navigator.of(context).push(
                        //   MaterialPageRoute<void>(
                        //     builder: (context) => preview(),
                        //   ),
                        // );
                      },
                      child: const Text(
                        "Aceptar",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ]));
  }
}
