import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sm_app_invidente/main.dart';
import 'package:sm_app_invidente/preview.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:sm_app_invidente/globals.dart' as globals;



class imagen extends StatefulWidget{
  @override
  _imagenState createState() => _imagenState();
}

class _imagenState extends State<imagen>{

  void _txt() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['txt', 'pdf']
    );
    if (result == null) return;
    globals.pathTxt=result.files.first.path;
  }

  void _imagenGaleria(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png']
    );
    if (result == null) return;
    globals.pathImagen=result.files.first.path;
  }

  PickedFile? imageFile=null;

  void _foto(BuildContext context) async{
      final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera ,
      );
      setState(() {
      imageFile = pickedFile!;
      globals.imagenCamara = pickedFile!;
      });
    }

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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 1,
                      child: FloatingActionButton.extended(
                        heroTag: const Text('Imagen Galeria'),
                        label: const Text(
                          "Imagen Galeria",
                          style: const TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        icon: const Icon(
                          Icons.image,
                          size: 70.0,
                        ),
                        onPressed: () {
                          _imagenGaleria(context);
                          },
                      ),
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 1,
                    child: FloatingActionButton.extended(
                      heroTag: const Text('Hacer foto'),
                      label: const Text(
                        "Hacer foto",
                        style: const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 70.0,
                      ),
                      onPressed: () {
                        _foto(context);
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