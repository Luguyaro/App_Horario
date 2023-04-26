import 'package:flutter/material.dart';
import '../Widgets/Nav_bar.dart';
import '../Widgets/Widgets.dart';

class Ajustes_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de ajustes'),
      ),
      endDrawer: Nav_bar(),
      body: Container(
        color: Color.fromARGB(203, 158, 158, 158),
        child: Column(children: [
          Text("Perfil"),
          Text("Privacidad"),
          Text("Temas"),
          Expanded(child: Container()),
          PiePagina(actual:3)

        ],)
      ),
    );
  }
}

