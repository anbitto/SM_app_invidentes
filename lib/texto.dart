import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sm_app_invidente/main.dart';


class texto extends StatefulWidget{
  @override
  _textoState createState() => _textoState();
}

class _textoState extends State<texto>{
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
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Reconocimiento por txt",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                      ])),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 00.0, vertical: 40.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width * 1,
                  child: FloatingActionButton.extended(
                    heroTag: Text('Insertar fichero'),
                    label: Text('Insertar fichero'),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    icon: Icon(
                      Icons.text_snippet_outlined,
                      size: 70.0,
                    ),
                    onPressed: () {
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 230,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 1,
                      child: RaisedButton(
                        disabledColor: Colors.grey,
                        color: Colors.red,
                        onPressed: (){
                        },
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                              color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 1,
                      child: RaisedButton(
                        disabledColor: Colors.grey,
                        color: Colors.green,
                        onPressed: (){
                        },
                        child: Text(
                          "Aceptar",
                          style: TextStyle(
                              color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]
        ),
      ),);
  }
}