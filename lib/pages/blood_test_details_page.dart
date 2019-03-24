import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:selfcare/model/bloodwork_result.dart';
import 'package:selfcare/resources/colors.dart';
import 'package:selfcare/resources/dimens.dart';

class BloodTestDetailsPage extends StatefulWidget {
  final List<BloodworkResult> bloodworksResults;
  final String title;

  const BloodTestDetailsPage(this.bloodworksResults, this.title);

  @override
  _BloodTestDetailsState createState() => _BloodTestDetailsState();
}

class _BloodTestDetailsState extends State<BloodTestDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    List<BloodworkResult> results = widget.bloodworksResults;
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildResultItem(results[index]);
        });
  }

  Widget _buildResultItem(BloodworkResult data) {
    return Row(
      children: <Widget>[
      ],
    );
  }
}
