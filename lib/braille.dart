import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sm_app_invidente/main.dart';
import 'package:sm_app_invidente/text2braille.dart';

class braille extends StatefulWidget {
  @override
  _brailleState createState() => _brailleState();
}

class _brailleState extends State<braille> {
  final t2b = text2brailleState();
  List<String> res = [];
  @override
  Widget build(BuildContext context) {
    //Guardamos la lista de string que esperamos que nos devuelva (Future) la función de text2braille para que cuando llegue guardar su valor en una lista string vacía 
    Future<List<String>> stringFuture = t2b.t2bApiCall();
    stringFuture.then((value) {
      res = value;
    });
    //Creamos una variable auxiliar para posteriormente unir las letras traducidas a braille en un solo string
    String aux = "";
    for (int i = 0; i < res.length; i++) {
      aux += res[i];
    }
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
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Texto en Braille",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700)),
                      ])),
              Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(aux, style: TextStyle(fontSize: 20)),
                      ])),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 1,
                    child: FloatingActionButton.extended(
                      heroTag: const Text('Reproducir Braille'),
                      label: const Text(
                        "Reproducir",
                        style:
                        const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      icon: const Icon(
                        Icons.speaker,
                        size: 70.0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 1,
                    child: FloatingActionButton.extended(
                      heroTag: const Text('Volver Principal'),
                      label: const Text(
                        "Volver al menú principal",
                        style:
                        const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      icon: const Icon(
                        Icons.home,
                        size: 70.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => MyApp(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ]));
  }
}
