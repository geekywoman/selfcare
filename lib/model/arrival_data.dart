class ArrivalData {
  int id;
  int appointmentId;
  String arrivalData;
  String healthcareProvider;
  String typeOfHealthcare;
  String location;

  ArrivalData({this.id, this.appointmentId, this.arrivalData,
      this.healthcareProvider, this.typeOfHealthcare, this.location});


  factory ArrivalData.fromJson(Map<String, dynamic> json) {
    return ArrivalData(
      id: json['id'],
      appointmentId: json['appointmentId'],
      arrivalData: json['arrivalData'],
      healthcareProvider: json['healthcareProvider'],
      typeOfHealthcare: json['typeOfHealthcare'],
      location: json['location'],
    );
  }

}