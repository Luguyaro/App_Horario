import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/compara_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/principal_screen.dart';
import 'Screens/register_screen.dart';
import 'Screens/mi_horario.dart';
import 'Screens/ajustes_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => LoginScreen(),
  '/register': (BuildContext context) => RegisterScreen(),
  '/mi_horario': (BuildContext context) => Mi_Horario(),
  '/compara': (BuildContext context) => ComparaScreen(),
  '/ajustes': (BuildContext context) => Ajustes_Screen(),
  '/my_schedule': (BuildContext context) => MySchedule(),
};


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'yashora',
      initialRoute: "/login", 
    routes: routes,
      
    );
  }

}





