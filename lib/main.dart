import 'package:flutter/material.dart';
import 'package:semanda2flutter1/pages/home.page.dart';

void main(){
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "Calculadora seman 2",
     theme: ThemeData.light(),
     home: HomePage(),
   );
  }
}