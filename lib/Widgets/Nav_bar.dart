import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Screens/login_screen.dart';
import '../Screens/Import_imagen.dart';

class Nav_bar extends StatelessWidget {
  Nav_bar({
    super.key,
  });
  String user_nombre='Bruno Vallejos';
  String user_gmail= 'ejemplo@gmail.com';
  String ruta_user_imagen= 'assets/images/Palta_achorada.png';
  NetworkImage user_fondo= NetworkImage('https://images6.alphacoders.com/114/1148744.jpg');
  File? imagen;
  Future<void> _showImagePicker(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final image = File(pickedFile.path);
      // Guarda la imagen en la variable user_imagen
      imagen = image;
    }
  }
  @override
  Widget build(BuildContext context) {
    final user_imagen = File(ruta_user_imagen);
    return Drawer(
      backgroundColor: Color.fromARGB(209, 48, 138, 180),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user_nombre,
              style: TextStyle(
                color: Color.fromARGB(255, 49, 124, 33),
                backgroundColor: Color.fromARGB(255, 8, 74, 105)
                ),
              ), 
            accountEmail: Text(
              user_gmail,
              style: TextStyle(
                color: Color.fromARGB(255, 49, 124, 33),
                backgroundColor: Color.fromARGB(255, 8, 74, 105)
                ),
              ),
            currentAccountPicture: 
            CircleAvatar(
              child: ClipOval(
                child: Image.file(
                  user_imagen,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 26, 51, 28),
              image: DecorationImage(
                image: user_fondo,
                fit: BoxFit.cover,
              )
            ),
            otherAccountsPictures: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1)
                    )
                  ]
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Función que se ejecuta al presionar el botón
                        //showDialogBox();
                        _showImagePicker(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ajustes'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.rocket_launch),
            title: Text('Grupos'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.token),
            title: Text('Compartir ID'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Cerrar Sesión'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),

        ],
      ),
      
    );
  }
}
