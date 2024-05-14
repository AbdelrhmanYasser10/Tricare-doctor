class MyAppointementModel {
  bool? hasError;
  List<dynamic>? errors;
  List<dynamic>? messages;
  Data? data;

  MyAppointementModel({this.hasError,  this.errors,  this.messages, this.data});

  MyAppointementModel.fromJson(Map<String, dynamic> json) {
    hasError = json['hasError'];
    if (json['errors'] != null) {
      errors = <dynamic>[];
      json['errors'].forEach((v) { errors!.add(v); });
    }
    messages = json['messages'].cast<String>();
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasError'] = this.hasError;
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v.toJson()).toList();
    }
    data['messages'] = this.messages;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<List<String>>? partnersDaysTimes;
  List<PartnersTimes>? partnersTimes;

  Data({this.partnersDaysTimes, this.partnersTimes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['partners_days_times'] != null) {
      partnersDaysTimes = [];
      json['partners_days_times'].forEach((v) { v.forEach((e){partnersDaysTimes!.add(e);}); });
    }
    if (json['partners_times'] != null) {
      partnersTimes = <PartnersTimes>[];
      json['partners_times'].forEach((v) { partnersTimes!.add(new PartnersTimes.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.partnersDaysTimes != null) {
      data['partners_days_times'] = this.partnersDaysTimes!;
    }
    if (this.partnersTimes != null) {
      data['partners_times'] = this.partnersTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnersDaysTimes {

  List<PartnersTimes>? times;
  PartnersDaysTimes({this.times});

PartnersDaysTimes.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}

class PartnersTimes {
  String? dAYID;
  String? parttimeTime;

  PartnersTimes({this.dAYID, this.parttimeTime});

  PartnersTimes.fromJson(Map<String, dynamic> json) {
    dAYID = json['DAYID'];
    parttimeTime = json['parttime_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DAYID'] = this.dAYID;
    data['parttime_time'] = this.parttimeTime;
    return data;
  }
}