import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:ui';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  child: 
                  //Image.network( 
                  Image.asset(
                    'assets/images/background_image.jpg',
                    //Fuente: 'https://unsplash.com/photos/bOBM8CB4ZC4',
                    //'https://wallpaperaccess.com/full/1186594.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                            child: SizedBox(
                              width: size.width * .9,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: size.width * .15,
                                      bottom: size.width * .1,
                                    ),
                                    child: Text(
                                      'INGRESEMOS',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white.withOpacity(.8),
                                      ),
                                    ),
                                  ),
                                  component(
                                    Icons.account_circle_outlined,
                                    'Nombre del usuario...',
                                    false,
                                    false,
                                    _nameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor ingrese su nombre';
                                        }
                                        return null;
                                      },
                                  ),
                                  component(
                                    Icons.email_outlined,
                                    'Email...',
                                    false,
                                    true,
                                    _emailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor ingrese su correo electrónico';
                                        }
                                        if (!value.contains('@')) {
                                          return 'Por favor ingrese un correo electrónico válido';
                                        }
                                        return null;
                                      },
                                  ),
                                  component(
                                    Icons.lock_outline,
                                    'Contraseña...',
                                    true,
                                    false,
                                    _passwordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor ingrese su contraseña';
                                        }
                                        if (value.length < 6) {
                                          return 'La contraseña debe tener al menos 6 caracteres';
                                        }
                                        return null;
                                      },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: '¡Olvide mi contraseña!',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              HapticFeedback.lightImpact();
                                              Fluttertoast.showToast(
                                                msg:
                                                    'Se presiono el boton ¡Olvide mi contraseña!',
                                              );
                                            },
                                        ),
                                      ),


                                      RichText(
                                        text: TextSpan(text: 'Crear nueva cuenta',style: TextStyle(color: Colors.white,),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              HapticFeedback.lightImpact();
                                              Navigator.pushNamed(context, '/register');
                                            },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.width * .05),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      HapticFeedback.lightImpact();
                                      Fluttertoast.showToast(
                                        msg: 'Se presiono el boton Ingresar',
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: size.width * .05,
                                      ),
                                      height: size.width / 8,
                                      width: size.width / 1.25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TextButton(
                                            onPressed: () {Navigator.pushReplacementNamed(context, '/my_schedule');},
                                            child: Text('Ingreso', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,),),
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: size.width * .05),
                                  Text(
                                    'O ingresa con',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(.8),
                                    ),
                                  ),
                                  SizedBox(height: size.width * .05),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          // Add logic to handle Google login
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.google,
                                          color: Colors.white.withOpacity(.8),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          // Add logic to handle Facebook login
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.white.withOpacity(.8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component(
      IconData icon, String hintText, bool isPassword, bool isEmail, TextEditingController controller, {required String? Function(dynamic value) validator}) {

    Size size = MediaQuery.of(context).size;
    
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
        controller: controller,
        validator: validator,
      ),
    );
  }
}



class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

//Widget component(IconData icon,String hintText,bool obscureText,bool isEmail,TextEditingController controller, {
//Function(String?)? validator,
//}) {
//return Padding(
//padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//child: TextFormField(
//obscureText: obscureText,
//keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
//decoration: InputDecoration(
//prefixIcon: Icon(
//icon,
//color: Colors.white.withOpacity(.8),
//),
//hintText: hintText,
//hintStyle: TextStyle(
//color: Colors.white.withOpacity(.8),
//),
//border: OutlineInputBorder(
//borderRadius: BorderRadius.circular(10),
//),
//enabledBorder: OutlineInputBorder(
//borderRadius: BorderRadius.circular(10),
//borderSide: BorderSide(
//color: Colors.white.withOpacity(.8),
//),
//),
//focusedBorder: OutlineInputBorder(
//borderRadius: BorderRadius.circular(10),
//borderSide: BorderSide(
//color: Colors.white.withOpacity(.8),
//),
//),
//),
//controller: controller,
//validator: validator,
//style: TextStyle(
//color: Colors.white.withOpacity(.8),
//),
//),
//);
//}
