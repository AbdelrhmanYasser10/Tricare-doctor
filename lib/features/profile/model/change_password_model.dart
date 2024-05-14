class ChangePasswordModel {
  bool? hasError;
  List? errors;
  List? messages;


  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    hasError = json['hasError'];
    errors = json['errors'];
    messages = json['messages'];
  }

}