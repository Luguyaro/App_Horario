import 'Activity.dart';
import 'Day.dart';


class Week {
  List<Day> day_Data = List<Day>.filled(7, Day());
  List<String> _days = ["LUNES","MARTES","MIERCOLES","JUEVES","VIERNES", "SÁBADO","DOMINGO"];
  int indexDay = 0;
  List<double> opacity = [1, 0.6, 0.4, 0.2, 0.1, 0.1, 0.1];
  
  void changeDay(int i){
    indexDay=i;
    if(indexDay==7){indexDay=0;} 
    changeOpacity(indexDay);
  }
  void changeOpacity(int day){
    List<double> newopacity =[0.1,0.1,0.1,0.1,0.1,0.1,0.1];
    newopacity[day]=1;
    if(day>0){newopacity[day-1]=0.6;}
    if(day>1){newopacity[day-2]=0.4;}
    if(day>2){newopacity[day-3]=0.2;}
    if(day<6){newopacity[day+1]=0.6;}
    if(day<5){newopacity[day+2]=0.4;}
    if(day<4){newopacity[day+3]=0.2;}
    opacity= newopacity;
  }

  void addDay(Day day){
    day_Data.add(day);
  }
  void restart(Week week){
    for (Activity activity in week.day_Data[week.indexDay].activityData) {
      activity.isActive = false;
      activity.name = "";
      activity.description = "";
    }
  }
  void allOnPressOff(Week week){
    for(Day day in week.day_Data){
      for(Activity act in day.activityData){
        act.isPressed = false;
      }}
  }

  Week();


  Map<String, dynamic> toJson() {
    return {
      'dayData': day_Data.map((day) => day.toJson()).toList(),
    };
  }
  
  // Constructor para crear una instancia desde JSON
  Week.fromJson(Map<String, dynamic> json) {
    day_Data = List<Day>.from(json['dayData'].map((dayJson) => Day.fromJson(dayJson)));
  }

  Week generateDefaultWeek() {
    //_prefs?.clear();
    final defaultweek =Week();
    
    for (int i = 0; i < 7; i++) {
      Day day = Day();
      day.key = i;
      day.dayName = _days[i];
      for (int j = 0; j < 17; j++) {
        Activity activity = Activity();
        activity.id = j+7;
        if(i==0 && j==0) {activity.name="pulsa 2 veces"; activity.description="mantener para editar";};
        //if(i==0 && j==0) activity.name="para editar";
        day.activityData[j] = activity;
      }
      defaultweek.day_Data[i] = day;
      defaultweek.day_Data[i].key =i;
    }
   
    return defaultweek;
  }

}

