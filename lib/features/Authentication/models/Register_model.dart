class RegisterModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
/*
  late Data? data;
*/

  RegisterModel.formJson(Map<String,dynamic> json){
    hasError = json['hasError'];
    errors = json['errors'];
    messages = json['messages'];
  /*  if(json['data'] is Map)
    {
      data = Data.fromJson(json['data']);
    }
    else
    {
      data = null;
    }*/

  }

}

/*
class Data {
  String? patientUniqueId;
  Data({this.patientUniqueId});

  Data.fromJson(Map<String, dynamic> json) {
    patientUniqueId = json['patient_uniqueid'];
  }
*/


//}