class NotificationReadModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late List? data;

  NotificationReadModel.formJson(Map<String,dynamic> json){

    hasError = json['hasError'];
    errors = json['errors'];
    messages = json['messages'];
    if(json['data'] is Map)
    {

    }
    else
    {
      data = null;

    }

  }

}