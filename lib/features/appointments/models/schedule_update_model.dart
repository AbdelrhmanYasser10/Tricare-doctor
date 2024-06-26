class ScheduleUpdateModel {
  bool? hasError;
  List<dynamic>? errors;
  List<dynamic>? messages;
  Data? data;

  ScheduleUpdateModel({this.hasError, this.errors, this.messages, this.data});

  ScheduleUpdateModel.fromJson(Map<String, dynamic> json) {
    hasError = json['hasError'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors!.add((v));
      });
    }
    if(json['messages'] != null){
      messages = [];
      json['messages'].forEach((v){
        messages!.add(v);
      });
    }
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
  PartnersSlot? partnersSlot;

  Data({this.partnersSlot});

  Data.fromJson(Map<String, dynamic> json) {
    partnersSlot = json['partners_slot'] != null
        ? new PartnersSlot.fromJson(json['partners_slot'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.partnersSlot != null) {
      data['partners_slot'] = this.partnersSlot!.toJson();
    }
    return data;
  }
}

class PartnersSlot {
  String? pARTSLOTID;
  String? pARTNERID;
  String? rOOMID;
  String? rOOMSLOTID;
  int? partslotStatus;
  String? partslotDateStart;
  String? partslotDateEnd;
  String? dAYID;
  String? rOOMTIMEID;
  String? roomtimeName;
  String? roomtimeNameAr;
  String? roomtimeType;
  String? roomtimeStart;
  String? roomtimeLast;
  String? bRANCHID;
  String? roomName;
  String? roomNameAr;
  String? roomPic;
  String? roomStatus;
  String? roomDescription;
  String? roomOccupied;
  String? roomType;
  String? branchName;
  String? branchNameAr;
  String? branchPic;
  String? branchLocation;
  String? branchLocationAr;
  String? branchDescription;
  String? branchDescriptionAr;
  String? branchActive;
  String? branchPhone;
  String? branchEmail;
  String? branchWhatsapp;
  String? branchMapsX;
  String? branchMapsY;
  String? branchMapsUrl;
  String? branchPriority;
  String? branchManagerName;
  String? branchManagerPhone;
  String? branchManagerEmail;
  String? branchTradingId;
  String? branchTaxesId;
  String? status;

  PartnersSlot(
      {this.pARTSLOTID,
        this.pARTNERID,
        this.rOOMID,
        this.rOOMSLOTID,
        this.partslotStatus,
        this.partslotDateStart,
        this.partslotDateEnd,
        this.dAYID,
        this.rOOMTIMEID,
        this.roomtimeName,
        this.roomtimeNameAr,
        this.roomtimeType,
        this.roomtimeStart,
        this.roomtimeLast,
        this.bRANCHID,
        this.roomName,
        this.roomNameAr,
        this.roomPic,
        this.roomStatus,
        this.roomDescription,
        this.roomOccupied,
        this.roomType,
        this.branchName,
        this.branchNameAr,
        this.branchPic,
        this.branchLocation,
        this.branchLocationAr,
        this.branchDescription,
        this.branchDescriptionAr,
        this.branchActive,
        this.branchPhone,
        this.branchEmail,
        this.branchWhatsapp,
        this.branchMapsX,
        this.branchMapsY,
        this.branchMapsUrl,
        this.branchPriority,
        this.branchManagerName,
        this.branchManagerPhone,
        this.branchManagerEmail,
        this.branchTradingId,
        this.branchTaxesId,
        this.status});

  PartnersSlot.fromJson(Map<String, dynamic> json) {
    pARTSLOTID = json['PARTSLOTID'];
    pARTNERID = json['PARTNERID'];
    rOOMID = json['ROOMID'];
    rOOMSLOTID = json['ROOMSLOTID'];
    partslotStatus = json['partslot_status'];
    partslotDateStart = json['partslot_date_start'];
    partslotDateEnd = json['partslot_date_end'];
    dAYID = json['DAYID'];
    rOOMTIMEID = json['ROOMTIMEID'];
    roomtimeName = json['roomtime_name'];
    roomtimeNameAr = json['roomtime_name_ar'];
    roomtimeType = json['roomtime_type'];
    roomtimeStart = json['roomtime_start'];
    roomtimeLast = json['roomtime_last'];
    bRANCHID = json['BRANCHID'];
    roomName = json['room_name'];
    roomNameAr = json['room_name_ar'];
    roomPic = json['room_pic'];
    roomStatus = json['room_status'];
    roomDescription = json['room_description'];
    roomOccupied = json['room_occupied'];
    roomType = json['room_type'];
    branchName = json['branch_name'];
    branchNameAr = json['branch_name_ar'];
    branchPic = json['branch_pic'];
    branchLocation = json['branch_location'];
    branchLocationAr = json['branch_location_ar'];
    branchDescription = json['branch_description'];
    branchDescriptionAr = json['branch_description_ar'];
    branchActive = json['branch_active'];
    branchPhone = json['branch_phone'];
    branchEmail = json['branch_email'];
    branchWhatsapp = json['branch_whatsapp'];
    branchMapsX = json['branch_maps_x'];
    branchMapsY = json['branch_maps_y'];
    branchMapsUrl = json['branch_maps_url'];
    branchPriority = json['branch_priority'];
    branchManagerName = json['branch_manager_name'];
    branchManagerPhone = json['branch_manager_phone'];
    branchManagerEmail = json['branch_manager_email'];
    branchTradingId = json['branch_trading_id'];
    branchTaxesId = json['branch_taxes_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PARTSLOTID'] = this.pARTSLOTID;
    data['PARTNERID'] = this.pARTNERID;
    data['ROOMID'] = this.rOOMID;
    data['ROOMSLOTID'] = this.rOOMSLOTID;
    data['partslot_status'] = this.partslotStatus;
    data['partslot_date_start'] = this.partslotDateStart;
    data['partslot_date_end'] = this.partslotDateEnd;
    data['DAYID'] = this.dAYID;
    data['ROOMTIMEID'] = this.rOOMTIMEID;
    data['roomtime_name'] = this.roomtimeName;
    data['roomtime_name_ar'] = this.roomtimeNameAr;
    data['roomtime_type'] = this.roomtimeType;
    data['roomtime_start'] = this.roomtimeStart;
    data['roomtime_last'] = this.roomtimeLast;
    data['BRANCHID'] = this.bRANCHID;
    data['room_name'] = this.roomName;
    data['room_name_ar'] = this.roomNameAr;
    data['room_pic'] = this.roomPic;
    data['room_status'] = this.roomStatus;
    data['room_description'] = this.roomDescription;
    data['room_occupied'] = this.roomOccupied;
    data['room_type'] = this.roomType;
    data['branch_name'] = this.branchName;
    data['branch_name_ar'] = this.branchNameAr;
    data['branch_pic'] = this.branchPic;
    data['branch_location'] = this.branchLocation;
    data['branch_location_ar'] = this.branchLocationAr;
    data['branch_description'] = this.branchDescription;
    data['branch_description_ar'] = this.branchDescriptionAr;
    data['branch_active'] = this.branchActive;
    data['branch_phone'] = this.branchPhone;
    data['branch_email'] = this.branchEmail;
    data['branch_whatsapp'] = this.branchWhatsapp;
    data['branch_maps_x'] = this.branchMapsX;
    data['branch_maps_y'] = this.branchMapsY;
    data['branch_maps_url'] = this.branchMapsUrl;
    data['branch_priority'] = this.branchPriority;
    data['branch_manager_name'] = this.branchManagerName;
    data['branch_manager_phone'] = this.branchManagerPhone;
    data['branch_manager_email'] = this.branchManagerEmail;
    data['branch_trading_id'] = this.branchTradingId;
    data['branch_taxes_id'] = this.branchTaxesId;
    data['status'] = this.status;
    return data;
  }
}