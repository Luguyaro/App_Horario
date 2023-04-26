import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../Data/User.dart';
import '../settings.dart';
import '../Screens/principal_screen.dart';

const _kPages = <String, IconData>{
  'mi Horario': Icons.home,
  'compara': Icons.map,
  'ajustes': Icons.add,
};

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.topCenter,

      child: Image(
        fit: BoxFit.cover ,
        image: AssetImage("assets/imagenes/fondo.jpg"),));
  }
}


class Encabezado extends StatelessWidget {
  const Encabezado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 80,
      decoration: BoxDecoration(
        color: const Color.fromARGB(248, 39, 203, 208),
        border: Border.all(width: 2, color: Color.fromARGB(187, 5, 161, 188)),
        borderRadius: BorderRadius.circular(10),
        ),

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            // Perfil
            CircleAvatar( 
                
                radius: 30,
                backgroundImage: AssetImage("assets/imagenes/Foto Bruno.jpeg"),
            ),
           
            // Titulos
            Column(
              children: [
                Text("YA ES HORA",textScaleFactor: 2.3 ,style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'asterik'),),
                Text("Mi horario: Bruno V.", textScaleFactor: 1.5,style: TextStyle(fontFamily: 'asterik'),),
              ],
            ),
            
            // Descarga
            Image(
              image: AssetImage("assets/imagenes/Descarga simbolo.png"),
              width: 35,
              height: 35,
              ),
          ],
        ),
      ),
    );
  }
}


class Selecionables extends StatelessWidget {
  const Selecionables({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.black,),
        borderRadius: BorderRadius.circular(10),
        
        ),
      padding: EdgeInsets.all(1),
      child: Text("h"));
  }
}



class Encabezado2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
      width: 500,
      height: 200,
      decoration: BoxDecoration(
        color: Color.fromARGB(248, 39, 203, 208),
        border: Border.all(width: 3, color: Color.fromARGB(187, 5, 161, 188)),
        borderRadius: BorderRadius.circular(10),
        ),

      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            // BotonPerfil
            CambiaImagenPerfil(),
           
           Expanded(child: Nombre(),),
            
            // Descarga
          ],
        ),
      ),

     ),
   ));
  }
}

class Nombre extends StatelessWidget {
  const Nombre({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 5, top: 20),
      child: Row(children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 100,
          height: 40,
          color: Colors.amber,
          child: Text("Nombre:"),
          ), 
        
        Container(
          
          alignment: Alignment.center,
          width: 160,
          height: 40,
          color: Colors.red,
          child: Text("Bruno V"))],),
    );
  }
}

class CambiaImagenPerfil extends StatelessWidget {
  const CambiaImagenPerfil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 200,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(border: Border.all(width: 2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image:AssetImage("assets/imagenes/Foto Bruno.jpeg"),
            fit: BoxFit.cover,
            alignment: Alignment.center)
        ),
        
    );
  }
}


//Funcional y oficial por mientras

//Pie de pagina
class PiePagina extends StatelessWidget {
  final int actual ;
  const PiePagina({
    super.key, required this.actual,
  });

  @override
  Widget build(BuildContext context) {
    List<int> orden=[];
    if(actual==1){orden=[0,1,1];};
    if(actual==2){orden=[1,0,1];};
    if(actual==3){orden=[1,1,0];};
    print(orden[0]);
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            //Ir a mi horario
            ButtonChange(actual:orden[0],colorboton: Colors.red,direccion:'/mi_horario' ,),
            
            //Actual
            ButtonChange(actual:orden[1],colorboton: Colors.amber,direccion: '/compara',),
            
            //Ir a Ajustes
            ButtonChange(actual:orden[2],colorboton: Colors.grey, direccion: '/ajustes',)
          ]));
  }
}

class ButtonChange extends StatelessWidget {
  final int actual;
  final Color colorboton;
  final String direccion;
  const ButtonChange({
    super.key, required this.actual, required this.colorboton, required this.direccion,
  });
  @override
  Widget build(BuildContext context) {
    if(actual==1){
      return TextButton(
    onPressed: () {Navigator.pushNamed(context, direccion);},
    child: Container(height: 30,width: 90,color: colorboton));
    }
    else{
      return Container(height: 35,width: 90,color: colorboton);
    }
  }
}


//PAGINA MI HORARIO
//Seccion de hora y botones, Enlace data

class HoraData extends StatelessWidget {
  const HoraData({super.key, required List<String> times, required this.data,}) : _times = times;
  final List<String> _times;
  final List<int> data;
  @override
  Widget build(BuildContext context) {
    //List<int> Lunes; List<int> Martes; List<int> Miercoles;
    //List<int> Jueves; List<int> Viernes; List<int> Sabado; List<int> Domingo;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: _times.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Horas
                Container(
                  width: 70,
                  alignment: Alignment.centerRight,
                  child: Text(_times[index],style: TextStyle(fontSize: 20.0),)),
                //Botones
                Botonfun(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Botonfun extends StatefulWidget {
  Botonfun({Key? key}) : super(key: key);
  @override
  _BotonfunState createState() => _BotonfunState();
}

class _BotonfunState extends State<Botonfun> {
  Color _colorFondo = Colors.white;
  int _data = 0;

  void _cambiarColor(int data) {
    if (data == 0) {_colorFondo = Colors.red;_data = 1;
    } else if (data == 1) {_colorFondo = Colors.green;_data = 2;
    } else if(data ==2){_colorFondo = Colors.white;_data = 0;}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _cambiarColor(_data);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _colorFondo,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: Colors.black),
          ),
        ),
        child: const Text(''),
      ),
    );
  }
}

// Cambio de fecha, 
class Fechas extends StatefulWidget {
  const Fechas({Key? key, required this.fechasld}) : super(key: key);
  final List<String> fechasld;
  @override
  _FechasState createState() => _FechasState(fechasld);
}

class _FechasState extends State<Fechas> {
  final List<String> diasSemana;
  int _indexDiaSemana = 0;

  _FechasState(this.diasSemana);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _indexDiaSemana = (_indexDiaSemana + 1) % diasSemana.length;
        });
      },
      child: Container(
        color: const Color.fromARGB(177, 255, 235, 59),
        width: 150,
        margin: const EdgeInsets.only(top: 10),
        /*decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: Color.fromARGB(255, 15, 225, 208),),
          borderRadius: BorderRadius.circular(10),),*/
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 15),
              Text(diasSemana[_indexDiaSemana]),
            ],
          ),
        ),
      ),
    );
  }
}


class NavigatorBar extends StatelessWidget {
  
  const NavigatorBar({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ConvexAppBar(//Menu de navegacion
        color: Settings().barBackGroundButton, 
        activeColor:Settings().barBackGroundButton,
        backgroundColor: Settings().barBackGround,
        height: 168,
        style:  TabStyle.reactCircle,
        items: <TabItem>[
          for (final entry in _kPages.entries)
            TabItem(icon: entry.value, title: entry.key),
        ],
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}

class WeekLetters extends StatelessWidget {
  const WeekLetters({
    super.key,
    required this.user, 
    required this.scrollController,
    required this.onDayPressed,
    
  });

  final User user;
  final ScrollController scrollController;
  final Function(int) onDayPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Row(
          children: List.generate(user.week.day_Data.length, (i) {
            return GestureDetector(onTap:(){
              onDayPressed(user.week.day_Data[i].key);} ,
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: Text(
                user.week.day_Data[i].dayName,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Settings().textcolor.withOpacity(user.week.opacity[i]),
      
                ),
              ),
            )
            );
          }),
        ),
      ),
    );
  }
}