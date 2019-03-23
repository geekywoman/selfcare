import 'package:selfcare/model/vaccination_code.dart';

class VaccinationData {
  String code;
  String codeName;
  List<VaccinationCode> codes;
  String codingSystem;
  String date;
  String senderDescription;

  VaccinationData(
      {this.code,
      this.codeName,
      this.codes,
      this.codingSystem,
      this.date,
      this.senderDescription});

  factory VaccinationData.fromJson(Map<String, dynamic> json) {
    return VaccinationData(
      code: json['code'],
      codeName: json['codeName'],
      codes: (json['codes'] as List).map((i) {
        return VaccinationCode.fromJson(i);
      }).toList(),
      codingSystem: json['codingSystem'],
      date: json['date'],
      senderDescription: json['senderDescription'],
    );
  }
}
