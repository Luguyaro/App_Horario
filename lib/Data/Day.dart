import 'Activity.dart';

class Day {
  int key = 0;
  String dayName = "";
  List<Activity> activityData = List<Activity>.filled(17, Activity());
  
  Day();
   
  

  void addActivity(Activity activity){
    activityData.add(activity);
  }

  void resetActivities() {
    for (Activity activity in activityData) {
      activity.isActive = false;
      activity.name = "";
      activity.description = "";
    }
  }

// Método para convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'dayName': dayName,
      'activityData': activityData.map((activity) => activity.toJson()).toList(),
    };
  }

  // Constructor para crear una instancia desde JSON
  Day.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    dayName = json['dayName'];
    activityData = List<Activity>.from(json['activityData'].map((activityJson) => Activity.fromJson(activityJson)));
  }

}