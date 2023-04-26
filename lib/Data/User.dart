import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Activity.dart';
import 'Week.dart';

//import 'package:shared_preferences/shared_preferences.dart';

class User  {
  String _name = "Bruno Vallejo";
  String _password = "Mamiriki";
  Image _profilePicture= Image.asset('assets/images/Foto Bruno.jpeg');
  Week _myweek = Week();
  List<String> Groups = [];

  String _jsondata="";
  SharedPreferences? _prefs;
  //Friends

  String get name => _name;
  String get password => _password;
  Image get profilePicture => _profilePicture;
  Week get week => _myweek;

  set name(String name) {
    _name = name;
  }
  set password(String password) {
    _password = password;
  }
  set profilePicture(Image profilePicture) {
    _profilePicture = profilePicture;
  }
  set week(Week week) {
    _myweek = week;
  }

  // Cargar el string JSON
Future<Week> load() async {
  //Week week = Week();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString('weekJson');
  
  if (jsonString == null) {    
    _myweek = _myweek.generateDefaultWeek();
    return _myweek;
  }
  //Map<String, dynamic> 
  final jsonMap = json.decode(jsonString);
  _myweek = Week.fromJson(jsonMap);
  return _myweek;
}

// Guardar el string JSON
Future<void> save() async {
    final prefs =_prefs ?? await SharedPreferences.getInstance();
    
    _jsondata = jsonEncode(_myweek.toJson());
    
    await prefs.setString('weekJson', _jsondata);
    //data = week.toMap() as List<String>;
  }

  
}
