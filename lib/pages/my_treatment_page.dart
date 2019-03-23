import 'package:flutter/material.dart';
import 'package:selfcare/api/network_util.dart';
import 'package:selfcare/model/return_data.dart';

class MyTreatmentPage extends StatefulWidget {
  @override
  _MyTreatmentPageStage createState() => _MyTreatmentPageStage();
}

class _MyTreatmentPageStage extends State<MyTreatmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My treatment'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    ReturnData returnData = NetworkUtils.instance.returnData;
    return Text(returnData.allergyData[0].type);
  }
}
