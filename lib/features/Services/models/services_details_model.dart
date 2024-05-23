import 'package:tricares_doctor_app/features/Services/models/services_model.dart';

class ServiceDetailsModel {
  bool? hasError;
  List<dynamic>? errors;
  List<dynamic>? messages;
  Data? data;

  ServiceDetailsModel({this.hasError, this.errors, this.messages, this.data});

  ServiceDetailsModel.fromJson(Map<String, dynamic> json) {
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
  Service? service;
  List<ServicesPosts>? servicesPosts;
  List<Services>? similarServices;

  Data({this.service, this.servicesPosts, this.similarServices});

  Data.fromJson(Map<String, dynamic> json) {
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    if (json['services_posts'] != null) {
      servicesPosts = <ServicesPosts>[];
      json['services_posts'].forEach((v) {
        servicesPosts!.add(new ServicesPosts.fromJson(v));
      });
    }
    if (json['similar_services'] != null) {
      similarServices = <Services>[];
      json['similar_services'].forEach((v) {
        similarServices!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.servicesPosts != null) {
      data['services_posts'] =
          this.servicesPosts!.map((v) => v.toJson()).toList();
    }
    if (this.similarServices != null) {
      data['similar_services'] =
          this.similarServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Service {
  String? sERVICEID;
  String? sERPOSTID;
  String? serviceName;
  String? serviceDescription;
  String? serviceActive;
  String? servicePriority;
  String? serviceNotes;
  String? serpostFilename;
  List<ServiceThumbs>? serviceThumbs;

  Service(
      {this.sERVICEID,
        this.sERPOSTID,
        this.serviceName,
        this.serviceDescription,
        this.serviceActive,
        this.servicePriority,
        this.serviceNotes,
        this.serpostFilename,
        this.serviceThumbs});

  Service.fromJson(Map<String, dynamic> json) {
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

class ServicesPosts {
  String? sERPOSTID;
  String? sERVICEID;
  String? serpostTitle;
  String? serpostFilename;
  String? serpostCover;

  ServicesPosts(
      {this.sERPOSTID,
        this.sERVICEID,
        this.serpostTitle,
        this.serpostFilename,
        this.serpostCover});

  ServicesPosts.fromJson(Map<String, dynamic> json) {
    sERPOSTID = json['SERPOSTID'];
    sERVICEID = json['SERVICEID'];
    serpostTitle = json['serpost_title'];
    serpostFilename = json['serpost_filename'];
    serpostCover = json['serpost_cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SERPOSTID'] = this.sERPOSTID;
    data['SERVICEID'] = this.sERVICEID;
    data['serpost_title'] = this.serpostTitle;
    data['serpost_filename'] = this.serpostFilename;
    data['serpost_cover'] = this.serpostCover;
    return data;
  }
}