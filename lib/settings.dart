import 'package:flutter/material.dart';

class Settings{
  //Barra de arriba y abajo
  Color _textcolor = Colors.black;
  Color _barBackGround=Color.fromARGB(255, 134, 134, 134);
  Color _barBackGroundButton= Colors.white;
  Color _barBackGroundText=Color.fromARGB(255, 219, 219, 219);
  
  Color get textcolor => _textcolor;
  Color get barBackGround => _barBackGround;
  Color get barBackGroundButton => _barBackGroundButton;
  Color get barBackGroundText => _barBackGroundText;

//Barra media
  Color _componentLeftBG =Color.fromARGB(255, 164, 164, 164);
  Color _componentNotActive =Color.fromARGB(255, 204, 204, 204);
  Color _componentAtive = Colors.red;
  Color _compontentText=Color.fromARGB(255, 71, 82, 94);

  Color get componentLeftBG => _componentLeftBG;
  Color get componentNotActive => _componentNotActive;
  Color get componentAtive => _componentAtive;
  Color get compontentText => _compontentText;

//Restart y Background
  Color _restartButton =const Color.fromRGBO(176, 176, 176, 100);
  Color _backGround =Color.fromRGBO(227, 227, 227, 100);

  Color get restartButton => _restartButton;
  Color get backGround => _backGround;


  final double _spacingLeft=35;
  final double _spacingRigth=35;

  double get spacingleft => _spacingLeft;
  double get spacingRigth => _spacingRigth;

  double heightAllContiner = 47;
  double heightButton = double.infinity;

  Text getText(String name,double size, Color color){
    Text st = Text(name,style:TextStyle(
            fontFamily: 'Lato',
            fontSize: size,
            fontWeight: FontWeight.w900,
            color: color,
            )) ;
    return st;
  }
}