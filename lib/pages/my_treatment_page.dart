import 'package:flutter/material.dart';

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
    return Text('body');
  }
}
