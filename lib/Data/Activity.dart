import 'package:flutter/material.dart';

class Activity {
  int id = 0;
  String _name = " ";
  String _description = " ";
  bool isActive = false;
  bool isPressed = false;

  final List<Color> _colors = [Colors.grey, Colors.red];

  Activity();


  List<Color> get colors => _colors;

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String get description => _description;

  set description(String description) {
    _description = description;
  }

  void toggleActive() {isActive = !isActive;}
  void toggleIsOnPressed() {isPressed = !isPressed;}
  
  // Método para convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isActive': isActive,
    };
  }

  // Constructor para crear una instancia desde JSON
  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['isActive'];
  }
  
}
