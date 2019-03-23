import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:selfcare/model/return_data.dart';

class NetworkUtils {
  Future<ReturnData> fetchPost() async {
    final response =
    await http.get('healthapi.hc.t.is/api/PatientData/GetPatient/2207399999');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return ReturnData.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}