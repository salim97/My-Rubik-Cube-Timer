import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:segment_display/segment_display.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double counter = 0;
  String counterString = "0.00";
  double tmp;
  Timer timer = null;
  Random rng = new Random();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void startTimer() {
    if (timer != null) {
      timer.cancel();
      setState(() {
        timer = null;
      });
    } else
      timer = Timer.periodic(Duration(milliseconds: 100), (v) {
        setState(() {
          counter += 0.1;
          tmp = counter + (rng.nextInt(99) / 1000).toDouble();
          counterString = tmp.toStringAsFixed(3);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Rubik Cube Timer by BENABADJI SALIM")),
      ),
      body: GestureDetector(
          onTap: () {
            startTimer();
          },
          onLongPress: () {
            timer.cancel();
            setState(() {
              timer = null;
            });
            setState(() {
              counter = 0;
              counterString = "0.00";
            });
          },
          child: Container(
              decoration: BoxDecoration(color: Colors.black),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          counterString,
                          style: TextStyle(color: Colors.white),
                        ))),
              ))),
    );
  }
}
