class UserModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  UserModel.formJson(Map<String,dynamic> json){
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
  bool? profileComplete;
  String? newNotifications;
  Partner? partner;



  Data.fromJson(Map<String, dynamic> json) {
    profileComplete = json['profileComplete'];
    newNotifications = json['new_notifications'];
    partner = json['partner'] != null ?  Partner.fromJson(json['partner']) : null;

  }


}

class Partner {
  String? pARTNERID;
  String? sPECIALTYID;
  String? partnerFullname;
  String? partnerName;
  String? partnerPosition;
  String? partnerDescription;
  String? partnerPhone;
  String? partnerStatus;
  String? partnerDoctor;
  String? partnerInvestor;
  String? partnerFeatured;
  String? partnerPriority;
  String? partnerEmail;
  String? partnerWebsite;
  String? partnerCountry;
  String? partnerPic;
  String? partnerCvfilename;
  String? partnerMylang;
  String? partnerUsername;
  String? partnerPassword;
  String? partnerLoginTime;
  String? partnerLip;
  String? partnerRememberMeKey;
  String? partnerRememberMeTime;
  String? partnerReviewsTotal;
  String? partnerReviewsAvg;
  String? partnerWhatsappNumber;
  String? partnerWhatsappEnabled;
  String? partnerTimezone;
  String? partnerDebitInitial;
  String? partnerCreditInitial;
  String? partnerBalanceInitial;
  String? partnerPurchases;
  String? partnerPurchasesTotal;
  String? partnerPurchasesPaid;
  String? partnerDebit;
  String? partnerCredit;
  String? partnerBalance;
  String? partnerTokens;
  String? partnerAccesstoken;
  String? partnerFirebaseAccesstoken;

  Partner(
      {this.pARTNERID,
        this.sPECIALTYID,
        this.partnerFullname,
        this.partnerName,
        this.partnerPosition,
        this.partnerDescription,
        this.partnerPhone,
        this.partnerStatus,
        this.partnerDoctor,
        this.partnerInvestor,
        this.partnerFeatured,
        this.partnerPriority,
        this.partnerEmail,
        this.partnerWebsite,
        this.partnerCountry,
        this.partnerPic,
        this.partnerCvfilename,
        this.partnerMylang,
        this.partnerUsername,
        this.partnerPassword,
        this.partnerLoginTime,
        this.partnerLip,
        this.partnerRememberMeKey,
        this.partnerRememberMeTime,
        this.partnerReviewsTotal,
        this.partnerReviewsAvg,
        this.partnerWhatsappNumber,
        this.partnerWhatsappEnabled,
        this.partnerTimezone,
        this.partnerDebitInitial,
        this.partnerCreditInitial,
        this.partnerBalanceInitial,
        this.partnerPurchases,
        this.partnerPurchasesTotal,
        this.partnerPurchasesPaid,
        this.partnerDebit,
        this.partnerCredit,
        this.partnerBalance,
        this.partnerTokens,
        this.partnerAccesstoken,
        this.partnerFirebaseAccesstoken});

  Partner.fromJson(Map<String, dynamic> json) {
    pARTNERID = json['PARTNERID'];
    sPECIALTYID = json['SPECIALTYID'];
    partnerFullname = json['partner_fullname'];
    partnerName = json['partner_name'];
    partnerPosition = json['partner_position'];
    partnerDescription = json['partner_description'];
    partnerPhone = json['partner_phone'];
    partnerStatus = json['partner_status'];
    partnerDoctor = json['partner_doctor'];
    partnerInvestor = json['partner_investor'];
    partnerFeatured = json['partner_featured'];
    partnerPriority = json['partner_priority'];
    partnerEmail = json['partner_email'];
    partnerWebsite = json['partner_website'];
    partnerCountry = json['partner_country'];
    partnerPic = json['partner_pic'];
    partnerCvfilename = json['partner_cvfilename'];
    partnerMylang = json['partner_mylang'];
    partnerUsername = json['partner_username'];
    partnerPassword = json['partner_password'];
    partnerLoginTime = json['partner_login_time'];
    partnerLip = json['partner_lip'];
    partnerRememberMeKey = json['partner_remember_me_key'];
    partnerRememberMeTime = json['partner_remember_me_time'];
    partnerReviewsTotal = json['partner_reviews_total'];
    partnerReviewsAvg = json['partner_reviews_avg'];
    partnerWhatsappNumber = json['partner_whatsapp_number'];
    partnerWhatsappEnabled = json['partner_whatsapp_enabled'];
    partnerTimezone = json['partner_timezone'];
    partnerDebitInitial = json['partner_debit_initial'];
    partnerCreditInitial = json['partner_credit_initial'];
    partnerBalanceInitial = json['partner_balance_initial'];
    partnerPurchases = json['partner_purchases'];
    partnerPurchasesTotal = json['partner_purchases_total'];
    partnerPurchasesPaid = json['partner_purchases_paid'];
    partnerDebit = json['partner_debit'];
    partnerCredit = json['partner_credit'];
    partnerBalance = json['partner_balance'];
    partnerTokens = json['partner_tokens'];
    partnerAccesstoken = json['partner_accesstoken'];
    partnerFirebaseAccesstoken = json['partner_firebase_accesstoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PARTNERID'] = this.pARTNERID;
    data['SPECIALTYID'] = this.sPECIALTYID;
    data['partner_fullname'] = this.partnerFullname;
    data['partner_name'] = this.partnerName;
    data['partner_position'] = this.partnerPosition;
    data['partner_description'] = this.partnerDescription;
    data['partner_phone'] = this.partnerPhone;
    data['partner_status'] = this.partnerStatus;
    data['partner_doctor'] = this.partnerDoctor;
    data['partner_investor'] = this.partnerInvestor;
    data['partner_featured'] = this.partnerFeatured;
    data['partner_priority'] = this.partnerPriority;
    data['partner_email'] = this.partnerEmail;
    data['partner_website'] = this.partnerWebsite;
    data['partner_country'] = this.partnerCountry;
    data['partner_pic'] = this.partnerPic;
    data['partner_cvfilename'] = this.partnerCvfilename;
    data['partner_mylang'] = this.partnerMylang;
    data['partner_username'] = this.partnerUsername;
    data['partner_password'] = this.partnerPassword;
    data['partner_login_time'] = this.partnerLoginTime;
    data['partner_lip'] = this.partnerLip;
    data['partner_remember_me_key'] = this.partnerRememberMeKey;
    data['partner_remember_me_time'] = this.partnerRememberMeTime;
    data['partner_reviews_total'] = this.partnerReviewsTotal;
    data['partner_reviews_avg'] = this.partnerReviewsAvg;
    data['partner_whatsapp_number'] = this.partnerWhatsappNumber;
    data['partner_whatsapp_enabled'] = this.partnerWhatsappEnabled;
    data['partner_timezone'] = this.partnerTimezone;
    data['partner_debit_initial'] = this.partnerDebitInitial;
    data['partner_credit_initial'] = this.partnerCreditInitial;
    data['partner_balance_initial'] = this.partnerBalanceInitial;
    data['partner_purchases'] = this.partnerPurchases;
    data['partner_purchases_total'] = this.partnerPurchasesTotal;
    data['partner_purchases_paid'] = this.partnerPurchasesPaid;
    data['partner_debit'] = this.partnerDebit;
    data['partner_credit'] = this.partnerCredit;
    data['partner_balance'] = this.partnerBalance;
    data['partner_tokens'] = this.partnerTokens;
    data['partner_accesstoken'] = this.partnerAccesstoken;
    data['partner_firebase_accesstoken'] = this.partnerFirebaseAccesstoken;
    return data;
  }
}
