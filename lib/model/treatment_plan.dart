import 'package:selfcare/model/treatment_item.dart';

class TreatmentPlan {
  int id;
  List<int> diagnosisIds;
  String type;
  String startDate;
  String endDate;
  String responsibleHCProvider;
  String planDescription;
  List<TreatmentItem> treatmentItems;

  TreatmentPlan({this.id, this.diagnosisIds, this.type, this.startDate,
      this.endDate, this.responsibleHCProvider, this.planDescription,
      this.treatmentItems});



  factory TreatmentPlan.fromJson(Map<String, dynamic> json) {
    return TreatmentPlan(
        id: json['id'],
        diagnosisIds: json['diagnosisIds'] as List,
        type: json['type'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        responsibleHCProvider: json['responsibleHCProvider'],
        planDescription: json['planDescription'],
        treatmentItems : (json['treatmentItems'] as List).map((i) {
          return TreatmentItem.fromJson(i);
        }).toList()
    );
  }


}