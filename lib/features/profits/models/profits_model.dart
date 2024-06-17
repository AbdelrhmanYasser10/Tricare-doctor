class ProfitsModel {
  bool? hasError;
  List<dynamic>? errors;
  List<dynamic>? messages;
  Data? data;

  ProfitsModel({this.hasError,  this.errors,  this.messages, this.data});

  ProfitsModel.fromJson(Map<String, dynamic> json) {
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
    if(json['data']!= null) {
      if(json['data'].isNotEmpty) {
        data = json['data'] != null ? new Data.fromJson(json['data']) : null;
      }
      else{
        data = null;
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasError'] = this.hasError;
    if (this.errors != null) {
      data['errors'] = this.errors!.toList();
    }
    if (this.messages != null) {
      data['messages'] = this.messages!.toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? resultsTotal;
  int? pageCurrent;
  int? pagePrev;
  int? pageNext;
  int? pageMax;
  List<PartnersOrders>? partnersOrders;

  Data(
      {this.resultsTotal,
        this.pageCurrent,
        this.pagePrev,
        this.pageNext,
        this.pageMax,
        this.partnersOrders});

  Data.fromJson(Map<String, dynamic> json) {
    resultsTotal = json['resultsTotal'];
    pageCurrent = json['pageCurrent'];
    pagePrev = json['pagePrev'];
    pageNext = json['pageNext'];
    pageMax = json['pageMax'];
    if (json['partners_orders'] != null) {
      partnersOrders = <PartnersOrders>[];
      json['partners_orders'].forEach((v) {
        partnersOrders!.add(new PartnersOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultsTotal'] = this.resultsTotal;
    data['pageCurrent'] = this.pageCurrent;
    data['pagePrev'] = this.pagePrev;
    data['pageNext'] = this.pageNext;
    data['pageMax'] = this.pageMax;
    if (this.partnersOrders != null) {
      data['partners_orders'] =
          this.partnersOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnersOrders {
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

  PartnersOrders(
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

  PartnersOrders.fromJson(Map<String, dynamic> json) {
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