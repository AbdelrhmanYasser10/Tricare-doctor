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
  Patient? patient;
  dynamic partner;



  Data.fromJson(Map<String, dynamic> json) {
    profileComplete = json['profileComplete'];
    newNotifications = json['new_notifications'];
    patient = json['patient'] != null ?  Patient.fromJson(json['patient']) : null;

  }


}

class Patient {
  String? pATIENTID;
  String? pATIENTAFID;
  String? patientUniqueid;
  String? patientFullname;
  String? patientType;
  String? patientEmail;
  String? patientPhone;
  String? patientTaxesId;
  String? patientTradingId;
  String? patientSales;
  String? patientSalesTotal;
  String? patientSalesPaid;
  String? patientSalesWithdrawed;
  String? patientDebit;
  String? patientCredit;
  String? patientBalance;
  String? patientDebitInitial;
  String? patientCreditInitial;
  String? patientBalanceInitial;
  String? patientUsername;
  String? patientPassword;
  String? patientGender;
  String? patientOrganization;
  String? patientDescription;
  String? patientCountry;
  String? patientOrders;
  String? patientAddTime;
  String? patientLoginTime;
  String? patientVerified;
  String? patientStatus;
  String? patientAssessed;
  String? patientAssessedNotes;
  String? patientForcePassword;
  String? patientProfilepicture;
  String? patientCoverpicture;
  String? patientWebsite;
  dynamic patientRememberMeKey;
  dynamic patientRememberMeTime;
  String? patientIp;
  String? patientLip;
  String? patientMylang;
  String? patientMycountry;
  String? patientFacebookConnected;
  String? patientFacebookId;
  String? patientVcode;
  String? patientVcodeTime;
  String? patientResetVcode;
  String? patientResetVcodeTime;
  String? patientGoogleConnected;
  String? patientGoogleId;
  String? patientCity;
  String? patientStreet;
  String? patientBuilding;
  String? patientPhone2;
  String? patientAddressInfo;
  String? patientCode;
  String? patientPoints;
  String? patientWhatsappEnabled;
  String? patientWhatsappNumber;
  String? patientTimezone;
  String? patientIdcardFilename;
  String? patientAccesstoken;
  String? patientFirebaseAccesstoken;

  Patient.fromJson(Map<String, dynamic> json) {
    pATIENTID = json['PATIENTID'];
    pATIENTAFID = json['PATIENTAFID'];
    patientUniqueid = json['patient_uniqueid'];
    patientFullname = json['patient_fullname'];
    patientType = json['patient_type'];
    patientEmail = json['patient_email'];
    patientPhone = json['patient_phone'];
    patientTaxesId = json['patient_taxes_id'];
    patientTradingId = json['patient_trading_id'];
    patientSales = json['patient_sales'];
    patientSalesTotal = json['patient_sales_total'];
    patientSalesPaid = json['patient_sales_paid'];
    patientSalesWithdrawed = json['patient_sales_withdrawed'];
    patientDebit = json['patient_debit'];
    patientCredit = json['patient_credit'];
    patientBalance = json['patient_balance'];
    patientDebitInitial = json['patient_debit_initial'];
    patientCreditInitial = json['patient_credit_initial'];
    patientBalanceInitial = json['patient_balance_initial'];
    patientUsername = json['patient_username'];
    patientPassword = json['patient_password'];
    patientGender = json['patient_gender'];
    patientOrganization = json['patient_organization'];
    patientDescription = json['patient_description'];
    patientCountry = json['patient_country'];
    patientOrders = json['patient_orders'];
    patientAddTime = json['patient_add_time'];
    patientLoginTime = json['patient_login_time'];
    patientVerified = json['patient_verified'];
    patientStatus = json['patient_status'];
    patientAssessed = json['patient_assessed'];
    patientAssessedNotes = json['patient_assessed_notes'];
    patientForcePassword = json['patient_force_password'];
    patientProfilepicture = json['patient_profilepicture'];
    patientCoverpicture = json['patient_coverpicture'];
    patientWebsite = json['patient_website'];
    patientRememberMeKey = json['patient_remember_me_key'];
    patientRememberMeTime = json['patient_remember_me_time'];
    patientIp = json['patient_ip'];
    patientLip = json['patient_lip'];
    patientMylang = json['patient_mylang'];
    patientMycountry = json['patient_mycountry'];
    patientFacebookConnected = json['patient_facebook_connected'];
    patientFacebookId = json['patient_facebook_id'];
    patientVcode = json['patient_vcode'];
    patientVcodeTime = json['patient_vcode_time'];
    patientResetVcode = json['patient_reset_vcode'];
    patientResetVcodeTime = json['patient_reset_vcode_time'];
    patientGoogleConnected = json['patient_google_connected'];
    patientGoogleId = json['patient_google_id'];
    patientCity = json['patient_city'];
    patientStreet = json['patient_street'];
    patientBuilding = json['patient_building'];
    patientPhone2 = json['patient_phone_2'];
    patientAddressInfo = json['patient_address_info'];
    patientCode = json['patient_code'];
    patientPoints = json['patient_points'];
    patientWhatsappEnabled = json['patient_whatsapp_enabled'];
    patientWhatsappNumber = json['patient_whatsapp_number'];
    patientTimezone = json['patient_timezone'];
    patientIdcardFilename = json['patient_idcard_filename'];
    patientAccesstoken = json['patient_accesstoken'];
    patientFirebaseAccesstoken = json['patient_firebase_accesstoken'];
  }


}
