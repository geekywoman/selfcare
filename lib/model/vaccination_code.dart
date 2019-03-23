class VaccinationCode {
  String disease;

  VaccinationCode({this.disease});

  factory VaccinationCode.fromJson(Map<String, dynamic> json) {
    return VaccinationCode(
      disease: json['disease'],
    );
  }
}
