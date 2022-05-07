import 'package:flutter/material.dart';
import 'package:sm_app_invidente/voz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App invidentes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'APP INVIDENTES',
          style: TextStyle(fontSize: 25.0, fontFamily: 'Glacial Indifference'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 00.0, vertical: 70.0),
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
                  horizontal: 00.0, vertical: 00.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: RaisedButton(
                  disabledColor: Colors.grey,
                  color: Colors.green,
                  onPressed: (){},
                  child: Text(
                    "Reconociemiento de texto en imagen",
                    style: TextStyle(
                        color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 00.0, vertical: 70.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: RaisedButton(
                  disabledColor: Colors.grey,
                  color: Colors.green,
                  onPressed: (){},
                  child: Text(
                    "Texto por teclado",
                    style: TextStyle(
                        color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 00.0, vertical: 0.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: RaisedButton(
                  disabledColor: Colors.grey,
                  color: Colors.green,
                  onPressed: (){},
                  child: Text(
                    "Extra?",
                    style: TextStyle(
                        color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
