class SessionDetailsModel {
  bool? hasError;
  List<dynamic>? errors;
  List<dynamic>? messages;
  Data? data;

  SessionDetailsModel({this.hasError, this.errors, this.messages, this.data});

  SessionDetailsModel.fromJson(Map<String, dynamic> json) {
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
  Session? session;

  Data({this.session});

  Data.fromJson(Map<String, dynamic> json) {
    session =
    json['session'] != null ? new Session.fromJson(json['session']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.session != null) {
      data['session'] = this.session!.toJson();
    }
    return data;
  }
}

class Session {
  String? sESSIONID;
  String? sLOTID;
  String? iNVID;
  String? pATIENTID;
  String? pARTNERID;
  String? rOOMID;
  String? sessionDuration;
  String? sessionType;
  String? sessionDay;
  String? sessionDate;
  String? sessionStart;
  String? sessionTimestamp;
  String? sessionNotes;
  String? sessionStatus;
  String? sessionRepetition;
  String? sessionRepeated;
  String? sessionPartnerAttended;
  String? sessionPartnerRated;
  String? sessionPartnerNotes;
  String? sessionPartnerRating;
  String? sessionPartnerRatingPublished;
  String? sessionPatientAttended;
  String? sessionPatientRated;
  String? sessionPatientNotes;
  String? sessionPatientRating;
  String? sessionNotificationReminderSent;
  String? sessionNotificationReadySent;
  String? sessionNotificationLateSent;
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
  String? patientRememberMeKey;
  String? patientRememberMeTime;
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
  String? sessionDateDisplay;
  String? sessionStartDisplay;
  String? status;

  Session(
      {this.sESSIONID,
        this.sLOTID,
        this.iNVID,
        this.pATIENTID,
        this.pARTNERID,
        this.rOOMID,
        this.sessionDuration,
        this.sessionType,
        this.sessionDay,
        this.sessionDate,
        this.sessionStart,
        this.sessionTimestamp,
        this.sessionNotes,
        this.sessionStatus,
        this.sessionRepetition,
        this.sessionRepeated,
        this.sessionPartnerAttended,
        this.sessionPartnerRated,
        this.sessionPartnerNotes,
        this.sessionPartnerRating,
        this.sessionPartnerRatingPublished,
        this.sessionPatientAttended,
        this.sessionPatientRated,
        this.sessionPatientNotes,
        this.sessionPatientRating,
        this.sessionNotificationReminderSent,
        this.sessionNotificationReadySent,
        this.sessionNotificationLateSent,
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
        this.patientRememberMeKey,
        this.patientRememberMeTime,
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
        this.patientFirebaseAccesstoken,
        this.sessionDateDisplay,
        this.sessionStartDisplay,
        this.status});

  Session.fromJson(Map<String, dynamic> json) {
    sESSIONID = json['SESSIONID'];
    sLOTID = json['SLOTID'];
    iNVID = json['INVID'];
    pATIENTID = json['PATIENTID'];
    pARTNERID = json['PARTNERID'];
    rOOMID = json['ROOMID'];
    sessionDuration = json['session_duration'];
    sessionType = json['session_type'];
    sessionDay = json['session_day'];
    sessionDate = json['session_date'];
    sessionStart = json['session_start'];
    sessionTimestamp = json['session_timestamp'];
    sessionNotes = json['session_notes'];
    sessionStatus = json['session_status'];
    sessionRepetition = json['session_repetition'];
    sessionRepeated = json['session_repeated'];
    sessionPartnerAttended = json['session_partner_attended'];
    sessionPartnerRated = json['session_partner_rated'];
    sessionPartnerNotes = json['session_partner_notes'];
    sessionPartnerRating = json['session_partner_rating'];
    sessionPartnerRatingPublished = json['session_partner_rating_published'];
    sessionPatientAttended = json['session_patient_attended'];
    sessionPatientRated = json['session_patient_rated'];
    sessionPatientNotes = json['session_patient_notes'];
    sessionPatientRating = json['session_patient_rating'];
    sessionNotificationReminderSent =
    json['session_notification_reminder_sent'];
    sessionNotificationReadySent = json['session_notification_ready_sent'];
    sessionNotificationLateSent = json['session_notification_late_sent'];
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
    sessionDateDisplay = json['session_date_display'];
    sessionStartDisplay = json['session_start_display'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SESSIONID'] = this.sESSIONID;
    data['SLOTID'] = this.sLOTID;
    data['INVID'] = this.iNVID;
    data['PATIENTID'] = this.pATIENTID;
    data['PARTNERID'] = this.pARTNERID;
    data['ROOMID'] = this.rOOMID;
    data['session_duration'] = this.sessionDuration;
    data['session_type'] = this.sessionType;
    data['session_day'] = this.sessionDay;
    data['session_date'] = this.sessionDate;
    data['session_start'] = this.sessionStart;
    data['session_timestamp'] = this.sessionTimestamp;
    data['session_notes'] = this.sessionNotes;
    data['session_status'] = this.sessionStatus;
    data['session_repetition'] = this.sessionRepetition;
    data['session_repeated'] = this.sessionRepeated;
    data['session_partner_attended'] = this.sessionPartnerAttended;
    data['session_partner_rated'] = this.sessionPartnerRated;
    data['session_partner_notes'] = this.sessionPartnerNotes;
    data['session_partner_rating'] = this.sessionPartnerRating;
    data['session_partner_rating_published'] =
        this.sessionPartnerRatingPublished;
    data['session_patient_attended'] = this.sessionPatientAttended;
    data['session_patient_rated'] = this.sessionPatientRated;
    data['session_patient_notes'] = this.sessionPatientNotes;
    data['session_patient_rating'] = this.sessionPatientRating;
    data['session_notification_reminder_sent'] =
        this.sessionNotificationReminderSent;
    data['session_notification_ready_sent'] = this.sessionNotificationReadySent;
    data['session_notification_late_sent'] = this.sessionNotificationLateSent;
    data['PATIENTAFID'] = this.pATIENTAFID;
    data['patient_uniqueid'] = this.patientUniqueid;
    data['patient_fullname'] = this.patientFullname;
    data['patient_type'] = this.patientType;
    data['patient_email'] = this.patientEmail;
    data['patient_phone'] = this.patientPhone;
    data['patient_taxes_id'] = this.patientTaxesId;
    data['patient_trading_id'] = this.patientTradingId;
    data['patient_sales'] = this.patientSales;
    data['patient_sales_total'] = this.patientSalesTotal;
    data['patient_sales_paid'] = this.patientSalesPaid;
    data['patient_sales_withdrawed'] = this.patientSalesWithdrawed;
    data['patient_debit'] = this.patientDebit;
    data['patient_credit'] = this.patientCredit;
    data['patient_balance'] = this.patientBalance;
    data['patient_debit_initial'] = this.patientDebitInitial;
    data['patient_credit_initial'] = this.patientCreditInitial;
    data['patient_balance_initial'] = this.patientBalanceInitial;
    data['patient_username'] = this.patientUsername;
    data['patient_password'] = this.patientPassword;
    data['patient_gender'] = this.patientGender;
    data['patient_organization'] = this.patientOrganization;
    data['patient_description'] = this.patientDescription;
    data['patient_country'] = this.patientCountry;
    data['patient_orders'] = this.patientOrders;
    data['patient_add_time'] = this.patientAddTime;
    data['patient_login_time'] = this.patientLoginTime;
    data['patient_verified'] = this.patientVerified;
    data['patient_status'] = this.patientStatus;
    data['patient_assessed'] = this.patientAssessed;
    data['patient_assessed_notes'] = this.patientAssessedNotes;
    data['patient_force_password'] = this.patientForcePassword;
    data['patient_profilepicture'] = this.patientProfilepicture;
    data['patient_coverpicture'] = this.patientCoverpicture;
    data['patient_website'] = this.patientWebsite;
    data['patient_remember_me_key'] = this.patientRememberMeKey;
    data['patient_remember_me_time'] = this.patientRememberMeTime;
    data['patient_ip'] = this.patientIp;
    data['patient_lip'] = this.patientLip;
    data['patient_mylang'] = this.patientMylang;
    data['patient_mycountry'] = this.patientMycountry;
    data['patient_facebook_connected'] = this.patientFacebookConnected;
    data['patient_facebook_id'] = this.patientFacebookId;
    data['patient_vcode'] = this.patientVcode;
    data['patient_vcode_time'] = this.patientVcodeTime;
    data['patient_reset_vcode'] = this.patientResetVcode;
    data['patient_reset_vcode_time'] = this.patientResetVcodeTime;
    data['patient_google_connected'] = this.patientGoogleConnected;
    data['patient_google_id'] = this.patientGoogleId;
    data['patient_city'] = this.patientCity;
    data['patient_street'] = this.patientStreet;
    data['patient_building'] = this.patientBuilding;
    data['patient_phone_2'] = this.patientPhone2;
    data['patient_address_info'] = this.patientAddressInfo;
    data['patient_code'] = this.patientCode;
    data['patient_points'] = this.patientPoints;
    data['patient_whatsapp_enabled'] = this.patientWhatsappEnabled;
    data['patient_whatsapp_number'] = this.patientWhatsappNumber;
    data['patient_timezone'] = this.patientTimezone;
    data['patient_idcard_filename'] = this.patientIdcardFilename;
    data['patient_accesstoken'] = this.patientAccesstoken;
    data['patient_firebase_accesstoken'] = this.patientFirebaseAccesstoken;
    data['session_date_display'] = this.sessionDateDisplay;
    data['session_start_display'] = this.sessionStartDisplay;
    data['status'] = this.status;
    return data;
  }
}