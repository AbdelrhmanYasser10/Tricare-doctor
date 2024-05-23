class CountriesModel{

  late String label;
  late String value;

  CountriesModel({
    required this.label,
    required this.value,
});

  factory CountriesModel.fromJson(Map<String,dynamic>json){
   return CountriesModel(
       label: json["label"],
       value: json['value'],
   );
  }
}