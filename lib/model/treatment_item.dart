import 'package:selfcare/model/treatment.dart';

class TreatmentItem {
  String treatmentType;
  List<int> appointmentIds;
  String treatmentDescription;
  List<int> referralIds;
  List<Treatment> treatment;

  TreatmentItem({this.treatmentType, this.appointmentIds,
      this.treatmentDescription, this.referralIds, this.treatment});



  factory TreatmentItem.fromJson(Map<String, dynamic> json) {
    return TreatmentItem(
      treatmentType: json['treatmentType'],
      appointmentIds: json['appointmentIds'] as List,
      treatmentDescription: json['treatmentDescription'],
      referralIds: json['referralIds'] as List,
        treatment : (json['treatment'] as List).map((i) {
          return Treatment.fromJson(i);
        }).toList()
    );
  }


}