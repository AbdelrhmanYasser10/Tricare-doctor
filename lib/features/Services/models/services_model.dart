class ServicesModel {
  bool? hasError;
  List<dynamic>? errors;
  List<dynamic>? messages;
  Data? data;

  ServicesModel({this.hasError, this.errors, this.messages, this.data});

  ServicesModel.fromJson(Map<String, dynamic> json) {
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
  int? pagePrev;
  int? pageNext;
  int? pageMax;
  List<Services>? services;

  Data(
      {this.resultsTotal,
        this.pageCurrent,
        this.pagePrev,
        this.pageNext,
        this.pageMax,
        this.services});

  Data.fromJson(Map<String, dynamic> json) {
    resultsTotal = json['resultsTotal'];
    pageCurrent = json['pageCurrent'];
    pagePrev = json['pagePrev'];
    pageNext = json['pageNext'];
    pageMax = json['pageMax'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
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
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String? sERVICEID;
  String? sERPOSTID;
  String? serviceName;
  String? serviceDescription;
  String? serviceActive;
  String? servicePriority;
  String? serviceNotes;
  String? serpostFilename;
  List<ServiceThumbs>? serviceThumbs;

  Services(
      {this.sERVICEID,
        this.sERPOSTID,
        this.serviceName,
        this.serviceDescription,
        this.serviceActive,
        this.servicePriority,
        this.serviceNotes,
        this.serpostFilename,
        this.serviceThumbs});

  Services.fromJson(Map<String, dynamic> json) {
    sERVICEID = json['SERVICEID'];
    sERPOSTID = json['SERPOSTID'];
    serviceName = json['service_name'];
    serviceDescription = json['service_description'];
    serviceActive = json['service_active'];
    servicePriority = json['service_priority'];
    serviceNotes = json['service_notes'];
    serpostFilename = json['serpost_filename'];
    if (json['service_thumbs'] != null) {
      serviceThumbs = <ServiceThumbs>[];
      json['service_thumbs'].forEach((v) {
        serviceThumbs!.add(new ServiceThumbs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SERVICEID'] = this.sERVICEID;
    data['SERPOSTID'] = this.sERPOSTID;
    data['service_name'] = this.serviceName;
    data['service_description'] = this.serviceDescription;
    data['service_active'] = this.serviceActive;
    data['service_priority'] = this.servicePriority;
    data['service_notes'] = this.serviceNotes;
    data['serpost_filename'] = this.serpostFilename;
    if (this.serviceThumbs != null) {
      data['service_thumbs'] =
          this.serviceThumbs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceThumbs {
  String? sERPOSTID;
  String? serpostFilename;

  ServiceThumbs({this.sERPOSTID, this.serpostFilename});

  ServiceThumbs.fromJson(Map<String, dynamic> json) {
    sERPOSTID = json['SERPOSTID'];
    serpostFilename = json['serpost_filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SERPOSTID'] = this.sERPOSTID;
    data['serpost_filename'] = this.serpostFilename;
    return data;
  }
}