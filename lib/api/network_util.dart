import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:selfcare/model/patient_response.dart';
import 'package:selfcare/model/return_data.dart';

class NetworkUtils {
  static NetworkUtils _instance = new NetworkUtils.internal();
  NetworkUtils.internal();

  factory NetworkUtils() => _instance;

  static NetworkUtils get instance => _instance;

  ReturnData returnData;

  Future<PatientResponse> getPatient(String socialSecurityNumber) async {
    final response = await http.get(
        'http://healthapi.hc.t.is/api/PatientData/GetPatient/$socialSecurityNumber');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return PatientResponse.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
