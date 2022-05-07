import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sm_app_invidente/main.dart';
import 'package:sm_app_invidente/preview.dart';


class teclado extends StatefulWidget{
  @override
  _tecladoState createState() => _tecladoState();
}

class _tecladoState extends State<teclado>{
  var description = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'APP INVIDENTES',
          style: TextStyle(fontSize: 25.0, fontFamily: 'Glacial Indifference'),
        ),
      ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Escribe tu texto",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                      ])),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 00.0),
                child: TextFormField(
                  maxLines: null,
                  controller: description,
                  decoration: InputDecoration(
                    hintText: 'Texto',
                  ),
                ),
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