import 'package:flutter/material.dart';

Widget pintarBoton({required Widget componente, required dynamic metodo, int flex=1,Color color=Colors.grey}){
  return Expanded(
            flex: flex,
            child: Container(
              child: Padding(
              padding: const EdgeInsets.all(2.0),
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: color,
                  ),
                  onPressed: metodo, 
                  child: componente
                ) ,
              ),
        ));
}