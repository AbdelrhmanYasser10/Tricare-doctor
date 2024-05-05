class SettingModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  SettingModel.formJson(Map<String,dynamic> json){
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
  String? systemWhatsappEnabled;
  String? websiteContactWebsite;
  String? websiteContactEmail;
  String? websiteContactPhone;
  String? websiteContactFax;
  String? websiteContactWhatsapp;
  String? websiteContactAddress;
  String? websiteContactAddress2;
  String? websiteContactMapsX;
  String? websiteContactMapsY;
  String? websiteSocialFacebookUrl;
  String? websiteSocialTwitterUrl;
  String? websiteSocialInstagramUrl;
  String? websiteSocialYoutubeUrl;
  String? websiteSocialLinkedinUrl;
  String? websiteSocialPinterestUrl;
  String? websitePagesEnabled;
  String? websiteLogosEnabled;
  String? websitePartnersNavigationMode;
  String? websitePartnersReviewsEnabled;
  String? websiteReviewsEnabled;
  String? websiteSessionsEnabled;
  List<MainSpecialties>? mainSpecialties;



  Data.fromJson(Map<String, dynamic> json) {
    systemWhatsappEnabled = json['system_whatsapp_enabled'];
    websiteContactWebsite = json['website_contact_website'];
    websiteContactEmail = json['website_contact_email'];
    websiteContactPhone = json['website_contact_phone'];
    websiteContactFax = json['website_contact_fax'];
    websiteContactWhatsapp = json['website_contact_whatsapp'];
    websiteContactAddress = json['website_contact_address'];
    websiteContactAddress2 = json['website_contact_address_2'];
    websiteContactMapsX = json['website_contact_maps_x'];
    websiteContactMapsY = json['website_contact_maps_y'];
    websiteSocialFacebookUrl = json['website_social_facebook_url'];
    websiteSocialTwitterUrl = json['website_social_twitter_url'];
    websiteSocialInstagramUrl = json['website_social_instagram_url'];
    websiteSocialYoutubeUrl = json['website_social_youtube_url'];
    websiteSocialLinkedinUrl = json['website_social_linkedin_url'];
    websiteSocialPinterestUrl = json['website_social_pinterest_url'];
    websitePagesEnabled = json['website_pages_enabled'];
    websiteLogosEnabled = json['website_logos_enabled'];
    websitePartnersNavigationMode = json['website_partners_navigation_mode'];
    websitePartnersReviewsEnabled = json['website_partners_reviews_enabled'];
    websiteReviewsEnabled = json['website_reviews_enabled'];
    websiteSessionsEnabled = json['website_sessions_enabled'];
    if (json['main_specialties'] != null) {
      mainSpecialties = <MainSpecialties>[];
      json['main_specialties'].forEach((v) {
        mainSpecialties!.add(new MainSpecialties.fromJson(v));
      });
    }
  }


}

class MainSpecialties {
  String? sPECIALTYID;
  String? pARENTSPECID;
  String? specialtyTitle;
  String? specialtyDescription;
  String? specialtyPic;
  String? specialtyActive;
  String? specialtyPriority;
  String? specialtyPartners;



  MainSpecialties.fromJson(Map<String, dynamic> json) {
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
