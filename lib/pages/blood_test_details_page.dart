import 'package:flutter/material.dart';
import 'package:selfcare/model/bloodwork_result.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/images.dart';

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
    return Padding(
      padding: const EdgeInsets.all(Dimens.mediumSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildImageHeader(),
          _buildList(),
        ],
      ),
    );
  }

  Widget _buildImageHeader() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: Dimens.mediumSpacing),
        child: bloodSvg);
  }

  Widget _buildList() {
    List<BloodworkResult> results = widget.bloodworksResults;
    return Expanded(
      child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildResultItem(results[index]);
          }),
    );
  }

  Widget _buildResultItem(BloodworkResult data) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.smallSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(data.type), Text('${data.value} ${data.unit}')],
      ),
    );
  }
}
