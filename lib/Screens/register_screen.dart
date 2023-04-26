import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Aquí va el formulario de registro'),
          Text('¿Ya tienes una cuenta? Inicia sesión'),
          SizedBox(height: 20), // un espacio entre el formulario y el botón
          TextButton(
            onPressed: () {Navigator.pushNamed(context, '/login');},
            child: Text('Ingresar'),
          ),
        ],
      ),
    );
  }
}

