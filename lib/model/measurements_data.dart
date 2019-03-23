import 'package:selfcare/model/measurement_item.dart';

class MeasurementData {
  int id;
  String date;
  String description;
  List<MeasurementItem> measurementItems;

  MeasurementData({this.id, this.date, this.description, this.measurementItems});


  factory MeasurementData.fromJson(Map<String, dynamic> json) {
    return MeasurementData(
      id: json['id'],
      date: json['date'],
      description: json['description'],
      measurementItems : (json['measurementItems'] as List).map((i) {
        return MeasurementItem.fromJson(i);
      }).toList()
    );
  }

}