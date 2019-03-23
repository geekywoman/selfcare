import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfcare/api/network_util.dart';
import 'package:selfcare/model/allergy_data.dart';
import 'package:selfcare/model/return_data.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/styles.dart';

class AllergyDetailPage extends StatefulWidget {
  @override
  _AllergyDetailPageState createState() => _AllergyDetailPageState();
}

class _AllergyDetailPageState extends State<AllergyDetailPage> {
  ReturnData returnData = NetworkUtils.instance.returnData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Allergies"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.mediumSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildHeader(),
            _buildListView(returnData.allergyData),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Name", style: CustomStyles.allergyTitleStyle,),
        Text("Type",  style: CustomStyles.allergyTitleStyle,),
        Text("Severity",  style: CustomStyles.allergyTitleStyle,),

      ],
    );
  }

  Widget _buildListView(List<AllergyData> allergyData) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: allergyData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Divider(color: Colors.grey,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(child: Text(allergyData[index].component)),
                  Flexible(child: Text(allergyData[index].type)),
                  Flexible(child: Text(allergyData[index].classification)),
                ],
              ),
            ],
          );
        });
  }
}
