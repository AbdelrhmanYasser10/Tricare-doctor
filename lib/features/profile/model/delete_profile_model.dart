class DeleteModel {
  bool? hasError;
  List? errors;
  List? messages;


  DeleteModel.fromJson(Map<String, dynamic> json) {
    hasError = json['hasError'];
    errors = json['errors'];
    messages = json['messages'];
  }

}