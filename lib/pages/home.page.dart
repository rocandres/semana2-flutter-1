import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child:Container(
            child: Text("Zona resultados"),
            color: Colors.blue,
          )),
          Expanded(
            flex: 1,
            child: 
            Container(
            child: Text("Zona de ingreso"),
            color: Colors.red,
          )),
          Expanded(
            flex: 2,
            child: 
            Container(
            child: Text("Zona de botones"),
            color: Colors.green,
          )),

        ],
      ),
    );
  }
}