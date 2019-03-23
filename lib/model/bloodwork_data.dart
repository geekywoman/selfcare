import 'package:selfcare/model/bloodwork_result.dart';

class BloodWorkData {
  String testDate;
  String resultDate;
  String labName;
  List<BloodworkResult> results;

  BloodWorkData({this.testDate, this.resultDate, this.labName, this.results});

  factory BloodWorkData.fromJson(Map<String, dynamic> json) {
    return BloodWorkData(
        testDate: json['testDate'],
        resultDate: json['resultDate'],
        labName: json['labName'],
        results: (json['results'] as List).map((i) {
          return BloodworkResult.fromJson(i);
        }).toList());
  }
}
