class ScheduleModel {
  bool? hasError;
  List<dynamic>? errors;
  List<dynamic>? messages;
  Data? data;

  ScheduleModel({this.hasError, this.errors, this.messages, this.data});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    hasError = json['hasError'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors!.add(v);
      });
    }
    if (json['messages'] != null) {
      messages = [];
      json['messages'].forEach((v) {
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
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<PartnersDaysRoomsSlots>? partnersDaysRoomsSlots;

  Data({this.partnersDaysRoomsSlots});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['partners_days_rooms_slots'] != null) {
      partnersDaysRoomsSlots = <PartnersDaysRoomsSlots>[];
      json['partners_days_rooms_slots'].forEach((v) {
        partnersDaysRoomsSlots!.add(new PartnersDaysRoomsSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.partnersDaysRoomsSlots != null) {
      data['partners_days_rooms_slots'] =
          this.partnersDaysRoomsSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnersDaysRoomsSlots {
  String? dayName;
  List<DayRooms>? dayRooms;

  PartnersDaysRoomsSlots({this.dayName, this.dayRooms});

  PartnersDaysRoomsSlots.fromJson(Map<String, dynamic> json) {
    dayName = json['day_name'];
    if (json['day_rooms'] != null) {
      dayRooms = <DayRooms>[];
      json['day_rooms'].forEach((v) {
        dayRooms!.add(new DayRooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day_name'] = this.dayName;
    if (this.dayRooms != null) {
      data['day_rooms'] = this.dayRooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DayRooms {
  String? roomName;
  String? branchName;
  String? roomPic;
  List<PartnersSlots>? partnersSlots;

  DayRooms({this.roomName, this.branchName, this.roomPic, this.partnersSlots});

  DayRooms.fromJson(Map<String, dynamic> json) {
    roomName = json['room_name'];
    branchName = json['branch_name'];
    roomPic = json['room_pic'];
    if (json['partners_slots'] != null) {
      partnersSlots = <PartnersSlots>[];
      json['partners_slots'].forEach((v) {
        partnersSlots!.add(new PartnersSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_name'] = this.roomName;
    data['branch_name'] = this.branchName;
    data['room_pic'] = this.roomPic;
    if (this.partnersSlots != null) {
      data['partners_slots'] =
          this.partnersSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnersSlots {
  String? pARTSLOTID;
  String? pARTNERID;
  String? rOOMID;
  String? rOOMSLOTID;
  String? dAYID;
  String? rOOMTIMEID;
  String? roomtimeName;
  String? roomtimeType;
  String? roomtimeStart;
  String? roomtimeLast;
  String? bRANCHID;
  String? roomName;
  String? roomPic;
  String? roomStatus;
  String? roomDescription;
  String? roomOccupied;
  String? roomType;
  String? branchName;
  String? branchPic;
  String? branchLocation;
  String? branchDescription;
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

  PartnersSlots(
      {this.pARTSLOTID,
        this.pARTNERID,
        this.rOOMID,
        this.rOOMSLOTID,
        this.dAYID,
        this.rOOMTIMEID,
        this.roomtimeName,
        this.roomtimeType,
        this.roomtimeStart,
        this.roomtimeLast,
        this.bRANCHID,
        this.roomName,
        this.roomPic,
        this.roomStatus,
        this.roomDescription,
        this.roomOccupied,
        this.roomType,
        this.branchName,
        this.branchPic,
        this.branchLocation,
        this.branchDescription,
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
        this.branchTaxesId});

  PartnersSlots.fromJson(Map<String, dynamic> json) {
    pARTSLOTID = json['PARTSLOTID'];
    pARTNERID = json['PARTNERID'];
    rOOMID = json['ROOMID'];
    rOOMSLOTID = json['ROOMSLOTID'];
    dAYID = json['DAYID'];
    rOOMTIMEID = json['ROOMTIMEID'];
    roomtimeName = json['roomtime_name'];
    roomtimeType = json['roomtime_type'];
    roomtimeStart = json['roomtime_start'];
    roomtimeLast = json['roomtime_last'];
    bRANCHID = json['BRANCHID'];
    roomName = json['room_name'];
    roomPic = json['room_pic'];
    roomStatus = json['room_status'];
    roomDescription = json['room_description'];
    roomOccupied = json['room_occupied'];
    roomType = json['room_type'];
    branchName = json['branch_name'];
    branchPic = json['branch_pic'];
    branchLocation = json['branch_location'];
    branchDescription = json['branch_description'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PARTSLOTID'] = this.pARTSLOTID;
    data['PARTNERID'] = this.pARTNERID;
    data['ROOMID'] = this.rOOMID;
    data['ROOMSLOTID'] = this.rOOMSLOTID;
    data['DAYID'] = this.dAYID;
    data['ROOMTIMEID'] = this.rOOMTIMEID;
    data['roomtime_name'] = this.roomtimeName;
    data['roomtime_type'] = this.roomtimeType;
    data['roomtime_start'] = this.roomtimeStart;
    data['roomtime_last'] = this.roomtimeLast;
    data['BRANCHID'] = this.bRANCHID;
    data['room_name'] = this.roomName;
    data['room_pic'] = this.roomPic;
    data['room_status'] = this.roomStatus;
    data['room_description'] = this.roomDescription;
    data['room_occupied'] = this.roomOccupied;
    data['room_type'] = this.roomType;
    data['branch_name'] = this.branchName;
    data['branch_pic'] = this.branchPic;
    data['branch_location'] = this.branchLocation;
    data['branch_description'] = this.branchDescription;
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
    return data;
  }
}