import 'package:flutter/material.dart';
import '../Widgets/Nav_bar.dart';
import '../Widgets/Widgets.dart';

class ComparaScreen extends StatelessWidget {
  const ComparaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final Color cajacolor = Colors.amber;
    return Scaffold(
      appBar: AppBar(
        title: Text('Compara'),),
      endDrawer: Nav_bar(),
      body: Container(
        color: Color.fromARGB(173, 255, 193, 7),
        child: Column(children: [
            Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Añadir amigo"),Text("crear grupo"),Text("subir archivo"), ],),
              
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[Text("selectividad"),Text("Amigo1"),Text("Eliminar")]),

              Text("Compara"),
            ],),
            
            Expanded(child: Container()),
            PiePagina(actual:2),
            
          ]),
      ));
  }
}

