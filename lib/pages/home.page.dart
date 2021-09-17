import 'dart:math';

import 'package:flutter/material.dart';
import 'package:semanda2flutter1/widget/botones.widget.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _operacion="";
  String _resultado="";
  String _error="";
  List<String> _listaOperaciones=[];
  List<double>_listaNumeros=[]  ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child:Container(
              
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Zona resultados"),
                Text("Zona resultados"),
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
                Column(                  
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(   
                      child: Padding(
                        padding:const EdgeInsets.all(10.0) ,
                        child:Text(_operacion,
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,)
                          ,),                                        
                      ),
                    ),
                    Container(
                      child: Text(_error,
                      style: TextStyle(fontSize: 20,
                      color: Colors.white
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            color: Colors.blueGrey,
          )),
          Expanded(
            flex: 2,
            child:  
            Container(
            child:  
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            color: Colors.blueGrey,
          )),

        ],
      ),
    );
  }

  metodoOperacion(String valor){
    setState(() {
      _operacion +=valor;      
    });
  
  }

  borrarTodo(){
    setState(() {
      _operacion ="";
      _error=""; 
      _listaOperaciones.clear();
      _listaNumeros.clear();
    });
  }

  borrarAnterior(){
    setState(() {
      if(_operacion.length > 0){  
        _operacion= _operacion.substring(0,_operacion.length-1)     ;
      }      
    });
    
  }

  ordenarOperacion(){
    String aux="";
    print(_operacion);
    for(var i=0; i < _operacion.length;i++){
      print(_operacion[i]);
      if(esNumero(_operacion[i])){        
         aux+=_operacion[i];
         
      }else{
        
        if(_listaOperaciones.length>0){
          if(aux=="" &&  _listaOperaciones[_listaOperaciones.length-1]=="x"){
          _listaOperaciones[_listaOperaciones.length-1]="x²";
          continue;
          }
        }
        _listaOperaciones.add(_operacion[i]);
        
        
        if(aux != ""){
          _listaNumeros.add(double.parse(aux));
        }   
        aux="";
      }

      if(_operacion.length-1 ==i && esNumero(aux) ){
        _listaNumeros.add(double.parse(aux));
      }
    }    
    

    print(_listaOperaciones);
    print(_listaNumeros);
  }


  dynamic operar( {required double a,required double b ,required String operacion}){

    switch (operacion) {
      case "+":
        return a+b;
      case "-":
        return a-b;
      case "x":
        return a*b;            
      case "÷":
          if(b==0){
            setState(() {
              _error="Division por 0 es indefinida";
            });
            return 0.0;
          }else{
            return a/b;
          }
      case "x":
        return a*b;
      case "x²":
        return pow(a, 2);
      case "√":
        return pow(a, 1/2);  

    }

  }

  resultado(){
    double aux=0.0;
    ordenarOperacion();
      for(var i=0; i < _listaOperaciones.length;i++){
        
        if(_listaOperaciones.length==1 && _listaNumeros.length==1){
          aux=operar(a:_listaNumeros[i] , b: 0, operacion: _listaOperaciones[i]);
        }else{
          if(i==0){
            aux=operar(a:_listaNumeros[i] , b:_listaNumeros[i+1] , operacion: _listaOperaciones[i]);
          }else{
            aux=operar(a:aux , b:_listaNumeros[i+1] , operacion: _listaOperaciones[i]);
        }
        }
        
        
        print(aux);
     }
    

  }



  bool esNumero(String numero){

    try{
      double.parse(numero);
      return true;
    }catch(e){
      return false;

    }

  }

  String formatoExpresion(String operacion){
    if(operacion.contains("x")){
      print("entre");
      operacion= operacion.replaceAll("x", "*");
    }
    if(operacion.contains("√")){
      operacion= operacion.replaceAll("√", "Sqrt(");
    }
    if(operacion.contains("÷")){
      operacion= operacion.replaceAll("÷", "/");
    }
    if(operacion.contains("²")){
      operacion=_operacion.replaceAll("*²", "^2");
    }    
    print(operacion);
    return operacion;
  }

  resultadoLibreria(){
    try {
      Parser parser = new Parser();
      ContextModel contextModel = new ContextModel();    
      Expression expressionFinal = parser.parse(formatoExpresion(_operacion));
      setState(() {
        _resultado = expressionFinal
            .evaluate(EvaluationType.REAL, contextModel)
            .toString();
        print(_resultado) ;
      });
    } catch (e) {
      setState(() {
        print(e.toString());
        _error = "Valide la expresión";
      });
    }
  }
  

_listaBotonesFila1(){
  return [
      pintarBoton(componente: Text("7"), metodo: (){metodoOperacion("7");}),
      pintarBoton(componente: Text("8"), metodo: (){metodoOperacion("8");}),
      pintarBoton(componente: Text("9"), metodo: (){metodoOperacion("9");}),
      pintarBoton(componente: Text("÷"), metodo: (){metodoOperacion("÷");}),
      pintarBoton(componente: Icon(Icons.arrow_back), metodo: (){borrarTodo();}),
      pintarBoton(componente: Text("C"), metodo: (){borrarAnterior();}),
      
       ];
}

_listaBotonesFila2(){
  return [
    pintarBoton(componente: Text("4"), metodo: (){metodoOperacion("4");}),
    pintarBoton(componente: Text("5"), metodo: (){metodoOperacion("5");}),
    pintarBoton(componente: Text("6"), metodo: (){metodoOperacion("6");}),
    pintarBoton(componente: Text("x"), metodo: (){metodoOperacion("x");}),
    pintarBoton(componente: Text("("), metodo: (){metodoOperacion("(");}),
    pintarBoton(componente: Text(")"), metodo: (){metodoOperacion(")");}),
      

  ];
}

_listaBotonesFila3(){
  return  [
    pintarBoton(componente: Text("1"), metodo: (){metodoOperacion("1");}),
    pintarBoton(componente: Text("2"), metodo: (){metodoOperacion("2");}),
    pintarBoton(componente: Text("3"), metodo: (){metodoOperacion("3");}),
    pintarBoton(componente: Text("-"), metodo: (){metodoOperacion("-");}),
    pintarBoton(componente: Text("x²"),metodo: (){metodoOperacion("x²");}),
    pintarBoton(componente: Text("√"), metodo: (){metodoOperacion("√");}),

  ];
}

_listaBotonesFila4(){
  return [
    pintarBoton(componente: Text("0"), metodo: (){metodoOperacion("0");}),
    pintarBoton(componente: Text("."), metodo: (){metodoOperacion(".");}),
    pintarBoton(componente: Text("%"), metodo: (){metodoOperacion("%");}),
    pintarBoton(componente: Text("+"), metodo: (){metodoOperacion("+");}),    
    pintarBoton(componente: Text("="), metodo: (){resultadoLibreria();},flex: 2,color: Colors.green),

  ];
}


}




