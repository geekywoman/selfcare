import 'package:flutter/material.dart';
import 'package:selfcare/model/treatment.dart';
import 'package:selfcare/resources/images.dart';

class TreatmentDetailsPage extends StatelessWidget {
  final Treatment treatment;

  const TreatmentDetailsPage(this.treatment);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(treatment.description),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildImageHeader(),
          _buildDescription(),
          _buildMoreInfo()
        ],
      ),
    );
  }

  Widget _buildImageHeader() {
    return medicineSvg;
  }

  Widget _buildDescription() {
    return Text('description');
  }

  Widget _buildMoreInfo() {
    return Text('more');
  }
}
