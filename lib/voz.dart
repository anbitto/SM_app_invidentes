import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sm_app_invidente/main.dart';
import 'package:sm_app_invidente/preview.dart';
import 'package:sm_app_invidente/globals.dart' as globals;


class voz extends StatefulWidget{
  @override
  _vozState createState() => _vozState();
}

class _vozState extends State<voz> {
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
                padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 1,
                      child: FloatingActionButton.extended(
                        heroTag: const Text('Dictar'),
                        label: const Text(
                          "Dictar",
                          style: const TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        icon: const Icon(
                          Icons.mic,
                          size: 70.0,
                        ),
                        onPressed: () {
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 1,
                    child: FloatingActionButton.extended(
                      heroTag: const Text('Reproducir'),
                      label: const Text(
                        "Reproducir",
                        style: const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      icon: const Icon(
                        Icons.speaker,
                        size: 70.0,
                      ),
                      onPressed: () {
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
                        style: const TextStyle(color: Colors.white, fontSize: 22),
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
                        globals.resultadoTexto="Vengo del Dictar";
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => preview(),
                          ),
                        );
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
