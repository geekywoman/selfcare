class EncounterData {
  int id;
  int arrivalId;
  String description;
  String referralId;

  EncounterData({this.id, this.arrivalId, this.description, this.referralId});


  factory EncounterData.fromJson(Map<String, dynamic> json) {
    return EncounterData(
      id: json['id'],
      arrivalId: json['arrivalId'],
      description: json['description'],
      referralId: json['referralId'],
    );
  }

}