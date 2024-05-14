class ScheculeAppointementsModel{
  late String schedule_sec;
  String? password;

  List<String>satDayTimes = [];
  List<String>sunDayTimes = [];
  List<String>monDayTimes = [];
  List<String>tueDayTimes = [];
  List<String>wedDayTimes = [];
  List<String>thursDayTimes = [];
  List<String>friDayTimes = [];

  ScheculeAppointementsModel({
    required this.schedule_sec,
    this.password
  });

  Map<String,dynamic> toMap(){

    return {
      'schedule_sec':schedule_sec,
      'password':password,
      "partners_slots_times[0][]":satDayTimes,
      "partners_slots_times[1][]":sunDayTimes,
      "partners_slots_times[2][]":monDayTimes,
      "partners_slots_times[3][]":tueDayTimes,
      "partners_slots_times[4][]":wedDayTimes,
      "partners_slots_times[5][]":thursDayTimes,
      "partners_slots_times[6][]":friDayTimes,
    };

  }

}