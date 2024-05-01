class LoginModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  LoginModel.formJson(Map<String,dynamic> json){
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
  Patient? patient;

  Data({this.patient});

  Data.fromJson(Map<String, dynamic> json) {
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

  Patient(
      {this.pATIENTID,
        this.pATIENTAFID,
        this.patientUniqueid,
        this.patientFullname,
        this.patientType,
        this.patientEmail,
        this.patientPhone,
        this.patientTaxesId,
        this.patientTradingId,
        this.patientSales,
        this.patientSalesTotal,
        this.patientSalesPaid,
        this.patientSalesWithdrawed,
        this.patientDebit,
        this.patientCredit,
        this.patientBalance,
        this.patientDebitInitial,
        this.patientCreditInitial,
        this.patientBalanceInitial,
        this.patientUsername,
        this.patientPassword,
        this.patientGender,
        this.patientOrganization,
        this.patientDescription,
        this.patientCountry,
        this.patientOrders,
        this.patientAddTime,
        this.patientLoginTime,
        this.patientVerified,
        this.patientStatus,
        this.patientAssessed,
        this.patientAssessedNotes,
        this.patientForcePassword,
        this.patientProfilepicture,
        this.patientCoverpicture,
        this.patientWebsite,
        this.patientIp,
        this.patientLip,
        this.patientMylang,
        this.patientMycountry,
        this.patientFacebookConnected,
        this.patientFacebookId,
        this.patientVcode,
        this.patientVcodeTime,
        this.patientResetVcode,
        this.patientResetVcodeTime,
        this.patientGoogleConnected,
        this.patientGoogleId,
        this.patientCity,
        this.patientStreet,
        this.patientBuilding,
        this.patientPhone2,
        this.patientAddressInfo,
        this.patientCode,
        this.patientPoints,
        this.patientWhatsappEnabled,
        this.patientWhatsappNumber,
        this.patientTimezone,
        this.patientIdcardFilename,
        this.patientAccesstoken,
        this.patientFirebaseAccesstoken});

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
