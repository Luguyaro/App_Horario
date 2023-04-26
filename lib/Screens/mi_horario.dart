import 'package:flutter/material.dart';
import '../Widgets/Nav_bar.dart';
import '../Widgets/Widgets.dart';
//import 'package:ya_es_hora/widgets/widgetsfuntions.dart';
/*
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
*/
class Mi_Horario extends StatelessWidget {
  final List<String> _times = List.generate(17, (index) => '${index + 7}:00');
  final List<int> data = [];
  final List<String> _fechas =["Lunes", "Martes","Miercoles","Jueves","Viernes","Sabado","Domingo"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Mi Horario'),
      ),
      endDrawer: Nav_bar(),
      body: Container(
        color: const Color.fromARGB(177, 244, 67, 54),
        child: Column(children: [

          Fechas(fechasld:_fechas),

          Expanded(child: 
            Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 25, top: 10),
            child: HoraData(times: _times,data: data,)),),

          BotonReinicio(),
          
          PiePagina(actual:1),
        ],),
      ),
    );
  }
}



class BotonReinicio extends StatelessWidget {
  const BotonReinicio({Key? key}) : super(key: key);

  void reiniciar() {
    // Aquí iría la función de reinicio
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 50),
      child: ElevatedButton(
        onPressed: reiniciar,
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 209, 205, 13),
        ),
        child: const Text("reinicio"),
      ),
    );
  }
}


