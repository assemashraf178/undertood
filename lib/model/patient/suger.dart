class SugarRate {
  String? sugar;
  String? dateTime;

  SugarRate({this.sugar, this.dateTime});

  SugarRate.fromJson(Map<String, dynamic>? json) {
    sugar = json!['sugar'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> get toMap => {"sugar": sugar, "dateTime": dateTime};
}
