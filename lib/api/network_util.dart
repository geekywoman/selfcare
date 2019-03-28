import 'dart:async';
import 'dart:collection';
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

  /// Get patient API call to receive the patient data
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

  Future<String> getNaturalLanguageKeywords(String chatText) async {
    Map<String, String> headers = {
      "Authorization": "Basic YXBpa2V5OlhLX2dla2lNc1hrUDFJNFNPd2dTX3dsZVpLdWFPR2tEUG9YcXNIdnJKZWll",
      "Content-Type": "application/json",
      "Accept" : "application/json"};

    Map body = {
      "text": "$chatText",
      "features": {
        "sentiment": {},
        "categories": {},
        "concepts": {},
        "entities": {},
        "keywords": {}
    }
    };

    final response = await http.post(
        'https://gateway-lon.watsonplatform.net/natural-language-understanding/api/v1/analyze?version=2018-11-16',
        headers: headers,
        body: json.encode(body));

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Error: getNaturalLanguageKeywords');
    }
  }
}
