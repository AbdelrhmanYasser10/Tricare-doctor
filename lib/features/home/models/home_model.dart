class HomeModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  HomeModel.formJson(Map<String,dynamic> json){
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
  List<Slides>? slides;
  List<String> images =[];

  List<Specialties>? specialties;
  List<PartnersTops>? partnersTops;
  List<Null>? featuredPartners;
  List<LatestPages>? latestPages;

  Data(
      {this.slides,

        this.specialties,
        this.partnersTops,
        this.featuredPartners,
        this.latestPages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['slides'] != null) {
      slides = <Slides>[];
      json['slides'].forEach((v) {
        slides!.add(Slides.fromJson(v));
        images.add(v['slide_pic']);
      });
    }

    if (json['specialties'] != null) {
      specialties = <Specialties>[];
      json['specialties'].forEach((v) {
        specialties!.add(new Specialties.fromJson(v));
      });
    }
    if (json['partners_tops'] != null) {
      partnersTops = <PartnersTops>[];
      json['partners_tops'].forEach((v) {
        partnersTops!.add(new PartnersTops.fromJson(v));
      });
    }
    // if (json['featured_partners'] != null) {
    //   featuredPartners = <Null>[];
    //   json['featured_partners'].forEach((v) {
    //     featuredPartners!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['latest_pages'] != null) {
      latestPages = <LatestPages>[];
      json['latest_pages'].forEach((v) {
        latestPages!.add(new LatestPages.fromJson(v));
      });
    }
  }


}

class Slides {
  String? sLIDEID;
  String? slideTitle;
  String? slideTitle2;
  String? slidePic;
  String? slideDetails;
  String? slideActive;
  String? slideUrl;
  bool? on = false;


  Slides.fromJson(Map<String, dynamic> json) {
    sLIDEID = json['SLIDEID'];
    slideTitle = json['slide_title'];
    slideTitle2 = json['slide_title_2'];
    slidePic = json['slide_pic'];
    slideDetails = json['slide_details'];
    slideActive = json['slide_active'];
    slideUrl = json['slide_url'];
  }


}

class Specialties {
  String? sPECIALTYID;
  String? pARENTSPECID;
  String? specialtyTitle;
  String? specialtyDescription;
  String? specialtyPic;
  String? specialtyActive;
  String? specialtyPriority;
  String? specialtyPartners;



  Specialties.fromJson(Map<String, dynamic> json) {
    sPECIALTYID = json['SPECIALTYID'];
    pARENTSPECID = json['PARENTSPECID'];
    specialtyTitle = json['specialty_title'];
    specialtyDescription = json['specialty_description'];
    specialtyPic = json['specialty_pic'];
    specialtyActive = json['specialty_active'];
    specialtyPriority = json['specialty_priority'];
    specialtyPartners = json['specialty_partners'];
  }


}

class PartnersTops {
  String? pARTOPID;
  String? pARTNERID;
  String? partopPoints;
  String? partnerName;
  String? partnerPosition;
  String? partnerPic;
  String? specialtyTitle;
  String? partnerRateAvg;



  PartnersTops.fromJson(Map<String, dynamic> json) {
    pARTOPID = json['PARTOPID'];
    pARTNERID = json['PARTNERID'];
    partopPoints = json['partop_points'];
    partnerName = json['partner_name'];
    partnerPosition = json['partner_position'];
    partnerPic = json['partner_pic'];
    specialtyTitle = json['specialty_title'];
    partnerRateAvg = json['partner_reviews_avg'];
  }


}

class LatestPages {
  String? pAGEID;
  String? pAGESCATID;
  String? pageName;
  String? pageActive;
  String? pagePriority;
  String? pageDescription;
  String? pagePic;
  String? pageTime;
  String? pageDate;



  LatestPages.fromJson(Map<String, dynamic> json) {
    pAGEID = json['PAGEID'];
    pAGESCATID = json['PAGESCATID'];
    pageName = json['page_name'];
    pageActive = json['page_active'];
    pagePriority = json['page_priority'];
    pageDescription = json['page_description'];
    pagePic = json['page_pic'];
    pageTime = json['page_time'];
    pageDate = json['page_date'];
  }


}
