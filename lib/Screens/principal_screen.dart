import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

import '../settings.dart';
import 'package:backdrop/backdrop.dart';
import '../Data/Activity.dart';
import '../Data/User.dart';

import '../Widgets/Widgets.dart';



class MySchedule extends StatefulWidget {
  const MySchedule({Key? key}) : super(key: key);
  

  @override
  _MySchedule createState() => _MySchedule();
}

class _MySchedule extends State<MySchedule> {
  User user = User();
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      user.load();
    });
  }
  
  void onDayPressed(int id) {
    setState(() {
      user.week.indexDay = id;
      user.week.changeDay(id);
      _controller.animateTo(
        (user.week.indexDay * 110).toDouble() - (MediaQuery.of(context).size.width / 2), 
        duration: Duration(milliseconds: 500), 
        curve: Curves.easeInOut,
      );
      user.save();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    _controller = ScrollController(initialScrollOffset: 
        (user.week.indexDay * 110).toDouble() - (MediaQuery.of(context).size.width / 2));
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: BackdropScaffold(
        headerHeight: 240,
        appBar: BackdropAppBar(
          backgroundColor: Settings().barBackGround,
          foregroundColor: Settings().barBackGroundButton,
          title: Text("Mi Horario"),),
        backLayer: Container(
          color: Settings().barBackGroundButton,
          width: double.infinity,
          child: Column(children: [
            Text("iniciar sesion"),
            Text("Descargar PDF"),
            Text("Descargar Excel"),
            ]),
        ),
        
        frontLayer: Container(
          color: Settings().backGround,
          child: Column(
            children: [

              Expanded( //El cuerpo 
                child: 
                GestureDetector(onTap: () {
                  setState(() {
                    user.week.allOnPressOff(user.week);
                    user.save();
                  });
                },
                child: TabBarView(
                  children: [
                    Container(
                      child: Column(
                      children: [
                        SizedBox(height: 25,),
                        
                        WeekLetters(user: user, scrollController: _controller,
                        onDayPressed: onDayPressed,),
                        
                        SizedBox(height: 20,),
                        
                        //Today and RestartButton
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: Settings().spacingleft, right: Settings().spacingRigth),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Settings().getText("24/04",23,Settings().textcolor),
                              //Boton de reinicio
                              Container(
                                height: 35,
                                child:ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: 
                                      MaterialStateProperty.all<Color>(Settings().restartButton)),
                                  onPressed: () {
                                    setState(() {
                                      user.week.restart(user.week);
                                      user.save();
                                    });
                                  },
                                  child:Text("Reinicio") ,) 
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 10,),

                        //Data
                        Expanded(child: ListView.builder(
                          itemCount: 17,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: RowData(act: user.week.day_Data[user.week.indexDay].activityData[index],
                              user: user,));
                          },
                        ))
                        
                      
                      ],),
                  ),
                    Container(child: Text("page2"),),
                    Container(child: Text("page3"),),
                  ],
                ),)
                
              ),
            ],
          ),
        ),
        
        bottomNavigationBar: NavigatorBar(),
      ),
    );
  }

  // Select style enum from dropdown menu:
  
  
}

class RowData extends StatefulWidget {
  final Activity act;
  final  User  user;
  RowData({
    Key? key,
    required this.act, required this.user
  }) : super(key: key);

  @override
  _RowDataState createState() => _RowDataState();
}

class _RowDataState extends State<RowData> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.act.toggleActive();
          widget.user.save();
        });
      },
      onDoubleTapDown: (_) {
        setState(() {
          widget.act.toggleIsOnPressed();
          widget.user.save();
        });
      },
      onLongPress: () async {
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Estas ocupado?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'actividad'),
                  onChanged: (value) {
                    setState(() {
                      widget.act.name = value;
                      widget.user.save();
                    }
                    );
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Descripción'),
                  onChanged: (value) {
                    setState(() {
                      widget.act.description = value;
                      widget.user.save();
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.act.name="";
                    widget.act.description="";
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Borrar',style: TextStyle(color: Settings().barBackGround),),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar',style: TextStyle(color: Settings().barBackGround),),
              ),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Settings().barBackGround)),
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.user.save();
                },
                child: Text('Guardar',style: TextStyle(color: Settings().barBackGroundButton),),
              ),
            ],
          ),
        );
        
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.act.isActive? Settings().componentAtive: Settings().componentLeftBG,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(
          left: Settings().spacingleft,
          right: Settings().spacingRigth,
        ),
        width: double.infinity,
        height: widget.act.isPressed ? 2.2 * Settings().heightAllContiner : Settings().heightAllContiner,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Settings().getText("${widget.act.id}:00",widget.act.isPressed ? 20:14, Settings().compontentText),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 50),
                height: Settings().heightButton,
                decoration: BoxDecoration(
                  color: Settings().componentNotActive,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Settings().getText(widget.act.name, 14, Settings().compontentText),
                    if (widget.act.isPressed)
                      Settings().getText(widget.act.description, 14, Settings().compontentText),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}  