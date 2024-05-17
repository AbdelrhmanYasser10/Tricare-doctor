class RoomsModel {
  bool? hasError;
  List<dynamic>? errors;
  List<dynamic>? messages;
  Data? data;

  RoomsModel({this.hasError, this.errors, this.messages, this.data});

  RoomsModel.fromJson(Map<String, dynamic> json) {
    hasError = json['hasError'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors!.add(v);
      });
    }
    if (json['messages'] != null) {
      messages =[];
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
  String? resultsTotal;
  int? pageCurrent;
  Null? pagePrev;
  Null? pageNext;
  int? pageMax;
  List<Rooms>? rooms;

  Data(
      {this.resultsTotal,
        this.pageCurrent,
        this.pagePrev,
        this.pageNext,
        this.pageMax,
        this.rooms});

  Data.fromJson(Map<String, dynamic> json) {
    resultsTotal = json['resultsTotal'];
    pageCurrent = json['pageCurrent'];
    pagePrev = json['pagePrev'];
    pageNext = json['pageNext'];
    pageMax = json['pageMax'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultsTotal'] = this.resultsTotal;
    data['pageCurrent'] = this.pageCurrent;
    data['pagePrev'] = this.pagePrev;
    data['pageNext'] = this.pageNext;
    data['pageMax'] = this.pageMax;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  String? pARTROOMID;
  String? pARTNERID;
  String? rOOMID;
  String? rOOMSLOTID;
  String? bRANCHID;
  String? roomName;
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

  Rooms(
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

  Rooms.fromJson(Map<String, dynamic> json) {
    pARTROOMID = json['PARTROOMID'];
    pARTNERID = json['PARTNERID'];
    rOOMID = json['ROOMID'];
    rOOMSLOTID = json['ROOMSLOTID'];
    bRANCHID = json['BRANCHID'];
    roomName = json['room_name'];
    roomStatus = json['room_status'];
    roomDescription = json['room_description'];
    roomOccupied = json['room_occupied'];
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