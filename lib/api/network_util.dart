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

  Future<dynamic> getNaturalLanguageKeywords(String chatText) async {
    Map<String, String> headers = {
      "Authorization":
          "Basic YXBpa2V5OnJIaVQ5YmMzSU1POUxyZGhTQWpRamxlaGRKN295cXBqaXkzMEtlRHl4d0xJ",
      "Content-Type": "application/json; charset=utf-8"
    };

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

    print("response ${response.statusCode} ${response.reasonPhrase}");
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Error: getNaturalLanguageKeywords');
    }
  }


  Future<Map<String, dynamic>> getAnswerFromBot(String chatText) async {
    Map<String, String> headers = {
      "Authorization": "Basic YXBpa2V5OnZ1dWlrZzdEQ0RpTVRqUVdxcjc1OFJXLUg2cGdDVlBXdkRGRUJ4MjRiN2dL",
      "Content-Type": "application/json",
      "Accept" : "application/json"
    };

    Map body = {
      "input" : {
        "text" : "$chatText"
      }
    };

    final response = await http.post(
      "https://gateway-lon.watsonplatform.net/assistant/api/v1/workspaces/81fa7dc9-27e2-41f7-a804-f5bfdbbeb325/message?version=2018-09-20",
      headers: headers,
      body: json.encode(body)
    );

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Error: getAnswerFromBot');
    }
  }
}
