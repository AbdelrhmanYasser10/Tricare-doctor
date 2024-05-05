class AboutUsModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  AboutUsModel.formJson(Map<String,dynamic> json){
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
  Static? static;

  Data({this.static});

  Data.fromJson(Map<String, dynamic> json) {
    static =
    json['static'] != null ? new Static.fromJson(json['static']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.static != null) {
      data['static'] = this.static!.toJson();
    }
    return data;
  }
}

class Static {
  String? sTATICID;
  String? staticTitle;
  String? staticDescription;
  String? staticPic;

  Static(
      {this.sTATICID,
        this.staticTitle,
        this.staticDescription,
        this.staticPic});

  Static.fromJson(Map<String, dynamic> json) {
    sTATICID = json['STATICID'];
    staticTitle = json['static_title'];
    staticDescription = json['static_description'];
    staticPic = json['static_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATICID'] = this.sTATICID;
    data['static_title'] = this.staticTitle;
    data['static_description'] = this.staticDescription;
    data['static_pic'] = this.staticPic;
    return data;
  }
}
