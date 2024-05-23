class TabsModel {
  String? sTATICID;
  String? staticTitle;
  String? staticDescription;
  String? staticPic;

  TabsModel(
      {this.sTATICID,
        this.staticTitle,
        this.staticDescription,
        this.staticPic});

  TabsModel.fromJson(Map<String, dynamic> json) {
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