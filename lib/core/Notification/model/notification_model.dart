class NotificationModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  NotificationModel.formJson(Map<String,dynamic> json){
    hasError = json['hasError'];
    errors = json['errors'];
    messages = json['messages'];
    if(json['data'] is Map)
    {
      data = Data.fromJson(json['data']);
    }
    else
    {
      data = null;
    }

  }
}

class Data {
  String? resultsTotal;
  int? pageCurrent;
  int? pagePrev;
  int? pageNext;
  int? pageMax;
  List<Notifications>? notification;


  Data.fromJson(Map<String, dynamic> json) {
    resultsTotal = json['resultsTotal'];
    pageCurrent = json['pageCurrent'];
    pagePrev = json['pagePrev'];
    pageNext = json['pageNext'];
    pageMax = json['pageMax'];
    if (json['partners_notifications'] != null) {
      notification = <Notifications>[];
      json['partners_notifications'].forEach((v) {
        notification!.add( Notifications.fromJson(v));
      });
    }
  }


}

class Notifications {
  String? partnerId;
  String? nOTIFICATIONID;
  String? notificationMessage;
  String? notificationTime;
  String? notificationDate;
  String? notificationRead;
  String? notificationAction;
  String? notificationActionId;
  String? notificationIcon;



  Notifications.fromJson(Map<String, dynamic> json) {

    partnerId = json['PARTNERID'];
    nOTIFICATIONID = json['PARTNOTIFICATIONID'];
    notificationMessage = json['partnotification_message'];
    notificationTime = json['partnotification_time'];
    notificationDate = json['partnotification_date'];
    notificationRead = json['partnotification_read'];
    notificationAction = json['partnotification_action'];
    notificationActionId = json['partnotification_action_id'];
    notificationIcon = json['partnotification_icon'];
  }


}