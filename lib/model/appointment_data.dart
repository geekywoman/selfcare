class AppointmentData {
  int id;
  int arrivalId;
  String appointmentTime;
  String location;
  String resource;

  AppointmentData(
      {this.id,
      this.arrivalId,
      this.appointmentTime,
      this.location,
      this.resource});

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
      id: json['id'],
      arrivalId: json['arrivalId'],
      appointmentTime: json['appointmentTime'],
      location: json['location'],
      resource: json['resource'],
    );
  }
}
