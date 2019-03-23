import 'package:selfcare/model/treatment.dart';

class TreatmentItem {
  String treatmentType;
  List<int> appointmentIds;
  String treatmentDescription;
  List<int> referralIds;
  List<Treatment> treatment;

  TreatmentItem(
      {this.treatmentType,
      this.appointmentIds,
      this.treatmentDescription,
      this.referralIds,
      this.treatment});

  factory TreatmentItem.fromJson(Map<String, dynamic> json) {
    return TreatmentItem(
        treatmentType: json['treatmentType'],
        appointmentIds: json['appointmentIds'] != null
            ? json['appointmentIds'].cast<int>() as List
            : null,
        treatmentDescription: json['treatmentDescription'],
        referralIds: json['referralIds'] != null
            ? json['referralIds'].cast<int>() as List
            : null,
        treatment: (json['treatment'] as List).map((i) {
          return Treatment.fromJson(i);
        }).toList());
  }
}
