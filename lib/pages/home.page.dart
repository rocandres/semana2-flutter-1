import 'package:flutter/material.dart';
import 'package:semanda2flutter1/widget/botones.widget.dart';

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
            flex: 4,
            child:Container(
            child: Row(
              children: [
                Text("Zona resultados"),
              ],
            ),
            color: Colors.blue,
          )),
          Expanded(
            flex: 1,
            child: 
            Container(
            child: Row(
              children: [
                Text("Zona de ingreso"),
              ],
            ),
            color: Colors.red,
          )),
          Expanded(
            flex: 3,
            child: 
            Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _listaBotonesFila1() ,
                ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _listaBotonesFila2(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:_listaBotonesFila3(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _listaBotonesFila4(),
                ),
              ],
            ),
            color: Colors.grey,
          )),

        ],
      ),
    );
  }
}




_listaBotonesFila1(){
  return [
      pintarBoton(componente: Text("7"), metodo: (){}),
      pintarBoton(componente: Text("8"), metodo: (){}),
      pintarBoton(componente: Text("9"), metodo: (){}),
      pintarBoton(componente: Text("÷"), metodo: (){}),
      pintarBoton(componente: Icon(Icons.arrow_back), metodo: (){}),
      pintarBoton(componente: Text("C"), metodo: (){}),
      
       ];
}

_listaBotonesFila2(){
  return [
    pintarBoton(componente: Text("4"), metodo: (){}),
    pintarBoton(componente: Text("5"), metodo: (){}),
    pintarBoton(componente: Text("6"), metodo: (){}),
    pintarBoton(componente: Text("x"), metodo: (){}),
    pintarBoton(componente: Text("("), metodo: (){}),
    pintarBoton(componente: Text(")"), metodo: (){}),
      

  ];
}

_listaBotonesFila3(){
  return  [
    pintarBoton(componente: Text("1"), metodo: (){}),
    pintarBoton(componente: Text("2"), metodo: (){}),
    pintarBoton(componente: Text("3"), metodo: (){}),
    pintarBoton(componente: Text("-"), metodo: (){}),
    pintarBoton(componente: Text("x²"),metodo: (){}),
    pintarBoton(componente: Text("√ "), metodo: (){}),

  ];
}

_listaBotonesFila4(){
  return [
    pintarBoton(componente: Text("0"), metodo: (){}),
    pintarBoton(componente: Text("."), metodo: (){}),
    pintarBoton(componente: Text("%"), metodo: (){}),
    pintarBoton(componente: Text("+"), metodo: (){}),    
    pintarBoton(componente: Text("="), metodo: (){},flex: 2),

  ];
}