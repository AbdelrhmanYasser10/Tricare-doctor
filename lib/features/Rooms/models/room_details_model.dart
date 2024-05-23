class RoomsDetailsModel {
  bool? hasError;
  List<dynamic>? errors;
  List<dynamic>? messages;
  Data? data;

  RoomsDetailsModel({this.hasError, this.errors, this.messages, this.data});

  RoomsDetailsModel.fromJson(Map<String, dynamic> json) {
    hasError = json['hasError'];
    if (json['errors'] != null) {
      errors =[];
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
  Room? room;
  List<PartnersDaysRooms>? partnersDaysRooms;

  Data({this.room, this.partnersDaysRooms});

  Data.fromJson(Map<String, dynamic> json) {
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
    if (json['partners_days_rooms'] != null) {
      partnersDaysRooms = <PartnersDaysRooms>[];
      json['partners_days_rooms'].forEach((v) {
        partnersDaysRooms!.add(new PartnersDaysRooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    if (this.partnersDaysRooms != null) {
      data['partners_days_rooms'] =
          this.partnersDaysRooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Room {
  String? pARTROOMID;
  String? pARTNERID;
  String? rOOMID;
  String? rOOMSLOTID;
  String? bRANCHID;
  String? roomName;
  String? roomPics;
  String? roomStatus;
  String? roomDescription;
  String? roomOccupied;
  String? roomType;
  String? branchName;
  String? branchPhone;
  String? branchLocation;
  String? branchActive;
  String? branchManagerName;
  String? branchManagerPhone;
  String? branchManagerEmail;
  String? branchTradingId;
  String? branchTaxId;

  Room(
      {this.pARTROOMID,
        this.pARTNERID,
        this.rOOMID,
        this.rOOMSLOTID,
        this.bRANCHID,
        this.roomName,
        this.roomStatus,
        this.roomDescription,
        this.roomOccupied,
        this.roomType,
        this.branchName,
        this.branchPhone,
        this.branchLocation,
        this.branchActive,
        this.branchManagerName,
        this.branchManagerPhone,
        this.branchManagerEmail,
        this.branchTradingId,
        this.branchTaxId});

  Room.fromJson(Map<String, dynamic> json) {
    pARTROOMID = json['PARTROOMID'];
    pARTNERID = json['PARTNERID'];
    rOOMID = json['ROOMID'];
    rOOMSLOTID = json['ROOMSLOTID'];
    bRANCHID = json['BRANCHID'];
    roomName = json['room_name'];
    roomStatus = json['room_status'];
    roomDescription = json['room_description'];
    roomOccupied = json['room_occupied'];
    roomPics = json['room_pic'];
    roomType = json['room_type'];
    branchName = json['branch_name'];
    branchPhone = json['branch_phone'];
    branchLocation = json['branch_location'];
    branchActive = json['branch_active'];
    branchManagerName = json['branch_manager_name'];
    branchManagerPhone = json['branch_manager_phone'];
    branchManagerEmail = json['branch_manager_email'];
    branchTradingId = json['branch_trading_id'];
    branchTaxId = json['branch_tax_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PARTROOMID'] = this.pARTROOMID;
    data['PARTNERID'] = this.pARTNERID;
    data['ROOMID'] = this.rOOMID;
    data['ROOMSLOTID'] = this.rOOMSLOTID;
    data['BRANCHID'] = this.bRANCHID;
    data['room_name'] = this.roomName;
    data['room_status'] = this.roomStatus;
    data['room_description'] = this.roomDescription;
    data['room_occupied'] = this.roomOccupied;
    data['room_type'] = this.roomType;
    data['branch_name'] = this.branchName;
    data['branch_phone'] = this.branchPhone;
    data['branch_location'] = this.branchLocation;
    data['branch_active'] = this.branchActive;
    data['branch_manager_name'] = this.branchManagerName;
    data['branch_manager_phone'] = this.branchManagerPhone;
    data['branch_manager_email'] = this.branchManagerEmail;
    data['branch_trading_id'] = this.branchTradingId;
    data['branch_tax_id'] = this.branchTaxId;
    return data;
  }
}

class PartnersDaysRooms {
  String? name;
  List<PartnersRooms>? partnersRooms;

  PartnersDaysRooms({this.name, this.partnersRooms});

  PartnersDaysRooms.fromJson(Map<String, dynamic> json) {
    name = json['day_name'];
    if (json['partners_rooms'] != null) {
      partnersRooms = <PartnersRooms>[];
      json['partners_rooms'].forEach((v) {
        partnersRooms!.add(new PartnersRooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day_name'] = this.name;
    if (this.partnersRooms != null) {
      data['partners_rooms'] =
          this.partnersRooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnersRooms {
  String? pARTROOMID;
  String? pARTNERID;
  String? rOOMID;
  String? rOOMSLOTID;
  String? dAYID;
  String? rOOMTIMEID;
  String? roomtimeName;
  String? roomtimeType;
  String? roomtimeStart;
  String? roomtimeLast;

  PartnersRooms(
      {this.pARTROOMID,
        this.pARTNERID,
        this.rOOMID,
        this.rOOMSLOTID,
        this.dAYID,
        this.rOOMTIMEID,
        this.roomtimeName,
        this.roomtimeType,
        this.roomtimeStart,
        this.roomtimeLast});

  PartnersRooms.fromJson(Map<String, dynamic> json) {
    pARTROOMID = json['PARTROOMID'];
    pARTNERID = json['PARTNERID'];
    rOOMID = json['ROOMID'];
    rOOMSLOTID = json['ROOMSLOTID'];
    dAYID = json['DAYID'];
    rOOMTIMEID = json['ROOMTIMEID'];
    roomtimeName = json['roomtime_name'];
    roomtimeType = json['roomtime_type'];
    roomtimeStart = json['roomtime_start'];
    roomtimeLast = json['roomtime_last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PARTROOMID'] = this.pARTROOMID;
    data['PARTNERID'] = this.pARTNERID;
    data['ROOMID'] = this.rOOMID;
    data['ROOMSLOTID'] = this.rOOMSLOTID;
    data['DAYID'] = this.dAYID;
    data['ROOMTIMEID'] = this.rOOMTIMEID;
    data['roomtime_name'] = this.roomtimeName;
    data['roomtime_type'] = this.roomtimeType;
    data['roomtime_start'] = this.roomtimeStart;
    data['roomtime_last'] = this.roomtimeLast;
    return data;
  }
}