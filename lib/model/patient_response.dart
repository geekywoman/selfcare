import 'package:selfcare/model/return_data.dart';

class PatientResponse{
  ReturnData returnData;

  PatientResponse({this.returnData});

  factory PatientResponse.fromJson(Map<String, dynamic> json) {
    return PatientResponse(
      returnData: ReturnData.fromJson(json['returnData']),
    );
  }

}