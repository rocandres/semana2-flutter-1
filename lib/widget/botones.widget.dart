import 'package:flutter/material.dart';

Widget pintarBoton({required Widget componente, required dynamic metodo, int flex=1}){
  return Expanded(
            flex: flex,
            child: Container(
              child: Padding(
              padding: const EdgeInsets.all(2.0),
                child:ElevatedButton(
                  onPressed: metodo, 
                  child: componente
                ) ,
              ),
        ));
}