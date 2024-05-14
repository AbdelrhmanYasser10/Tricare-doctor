class ProfitDetailsModel {
  bool? hasError;
  List<dynamic>? errors;
  List<dynamic>? messages;
  Data? data;

  ProfitDetailsModel({this.hasError, this.errors, this.messages, this.data});

  ProfitDetailsModel.fromJson(Map<String, dynamic> json) {
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
  PartnersOrder? partnersOrder;
  List<Payments>? payments;

  Data({this.partnersOrder, this.payments});

  Data.fromJson(Map<String, dynamic> json) {
    partnersOrder = json['partners_order'] != null
        ? new PartnersOrder.fromJson(json['partners_order'])
        : null;
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.partnersOrder != null) {
      data['partners_order'] = this.partnersOrder!.toJson();
    }
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnersOrder {
  String? pARTORDID;
  String? pARTNERID;
  String? cURRENCYID;
  String? partordInvNumber;
  String? partordDate;
  String? partordAmount;
  String? partordTaxes;
  String? partordTaxesTotal;
  String? partordTotal;
  String? partordPaid;
  String? partordRemaining;
  String? partordStatus;
  String? partordNotes;
  String? partordConversionRate;
  String? partordTotalConverted;
  String? partordPaymobOrderid;
  String? currencyName;
  String? status;

  PartnersOrder(
      {this.pARTORDID,
        this.pARTNERID,
        this.cURRENCYID,
        this.partordInvNumber,
        this.partordDate,
        this.partordAmount,
        this.partordTaxes,
        this.partordTaxesTotal,
        this.partordTotal,
        this.partordPaid,
        this.partordRemaining,
        this.partordStatus,
        this.partordNotes,
        this.partordConversionRate,
        this.partordTotalConverted,
        this.partordPaymobOrderid,
        this.currencyName,
        this.status});

  PartnersOrder.fromJson(Map<String, dynamic> json) {
    pARTORDID = json['PARTORDID'];
    pARTNERID = json['PARTNERID'];
    cURRENCYID = json['CURRENCYID'];
    partordInvNumber = json['partord_inv_number'];
    partordDate = json['partord_date'];
    partordAmount = json['partord_amount'];
    partordTaxes = json['partord_taxes'];
    partordTaxesTotal = json['partord_taxes_total'];
    partordTotal = json['partord_total'];
    partordPaid = json['partord_paid'];
    partordRemaining = json['partord_remaining'];
    partordStatus = json['partord_status'];
    partordNotes = json['partord_notes'];
    partordConversionRate = json['partord_conversion_rate'];
    partordTotalConverted = json['partord_total_converted'];
    partordPaymobOrderid = json['partord_paymob_orderid'];
    currencyName = json['currency_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PARTORDID'] = this.pARTORDID;
    data['PARTNERID'] = this.pARTNERID;
    data['CURRENCYID'] = this.cURRENCYID;
    data['partord_inv_number'] = this.partordInvNumber;
    data['partord_date'] = this.partordDate;
    data['partord_amount'] = this.partordAmount;
    data['partord_taxes'] = this.partordTaxes;
    data['partord_taxes_total'] = this.partordTaxesTotal;
    data['partord_total'] = this.partordTotal;
    data['partord_paid'] = this.partordPaid;
    data['partord_remaining'] = this.partordRemaining;
    data['partord_status'] = this.partordStatus;
    data['partord_notes'] = this.partordNotes;
    data['partord_conversion_rate'] = this.partordConversionRate;
    data['partord_total_converted'] = this.partordTotalConverted;
    data['partord_paymob_orderid'] = this.partordPaymobOrderid;
    data['currency_name'] = this.currencyName;
    data['status'] = this.status;
    return data;
  }
}

class Payments {
  String? pAYMENTID;
  String? uSERID;
  String? aCTIONID;
  String? oWNERID;
  String? bANKID;
  String? tRANSACTIONID;
  String? cURRENCYID;
  String? paymentType;
  String? paymentValue;
  String? paymentPtype;
  String? paymentRef;
  String? paymentDate;
  String? paymentPaymobTransactionid;
  String? paymentConversionRate;
  String? paymentValueConverted;

  Payments(
      {this.pAYMENTID,
        this.uSERID,
        this.aCTIONID,
        this.oWNERID,
        this.bANKID,
        this.tRANSACTIONID,
        this.cURRENCYID,
        this.paymentType,
        this.paymentValue,
        this.paymentPtype,
        this.paymentRef,
        this.paymentDate,
        this.paymentPaymobTransactionid,
        this.paymentConversionRate,
        this.paymentValueConverted});

  Payments.fromJson(Map<String, dynamic> json) {
    pAYMENTID = json['PAYMENTID'];
    uSERID = json['USERID'];
    aCTIONID = json['ACTIONID'];
    oWNERID = json['OWNERID'];
    bANKID = json['BANKID'];
    tRANSACTIONID = json['TRANSACTIONID'];
    cURRENCYID = json['CURRENCYID'];
    paymentType = json['payment_type'];
    paymentValue = json['payment_value'];
    paymentPtype = json['payment_ptype'];
    paymentRef = json['payment_ref'];
    paymentDate = json['payment_date'];
    paymentPaymobTransactionid = json['payment_paymob_transactionid'];
    paymentConversionRate = json['payment_conversion_rate'];
    paymentValueConverted = json['payment_value_converted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PAYMENTID'] = this.pAYMENTID;
    data['USERID'] = this.uSERID;
    data['ACTIONID'] = this.aCTIONID;
    data['OWNERID'] = this.oWNERID;
    data['BANKID'] = this.bANKID;
    data['TRANSACTIONID'] = this.tRANSACTIONID;
    data['CURRENCYID'] = this.cURRENCYID;
    data['payment_type'] = this.paymentType;
    data['payment_value'] = this.paymentValue;
    data['payment_ptype'] = this.paymentPtype;
    data['payment_ref'] = this.paymentRef;
    data['payment_date'] = this.paymentDate;
    data['payment_paymob_transactionid'] = this.paymentPaymobTransactionid;
    data['payment_conversion_rate'] = this.paymentConversionRate;
    data['payment_value_converted'] = this.paymentValueConverted;
    return data;
  }
}