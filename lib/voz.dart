import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sm_app_invidente/main.dart';


class voz extends StatefulWidget{
  @override
  _vozState createState() => _vozState();
}

class _vozState extends State<voz>{
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
                            Text("Dictar por voz",
                                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
                          ])),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 00.0, vertical: 15.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: RaisedButton(
                        disabledColor: Colors.grey,
                        color: Colors.green,
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) => voz(),
                            ),
                          );
                        },
                        child: Text(
                          "Dictar por voz",
                          style: TextStyle(
                              color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 00.0, vertical: 15.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: RaisedButton(
                        disabledColor: Colors.grey,
                        color: Colors.white,
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) => voz(),
                            ),
                          );
                        },
                        child: Text(
                          "Reproducir",
                          style: TextStyle(
                              color: Colors.black, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          disabledColor: Colors.grey,
                          color: Colors.red,
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (context) => voz(),
                              ),
                            );
                          },
                          child: Text(
                            "Borrar",
                            style: TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          disabledColor: Colors.grey,
                          color: Colors.green,
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (context) => voz(),
                              ),
                            );
                          },
                          child: Text(
                            "Aceptar",
                            style: TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                    ],
                  ),
                 ]
            )
        )
    );
  }
}