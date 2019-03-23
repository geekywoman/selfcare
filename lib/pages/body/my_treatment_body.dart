import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfcare/model/treatment.dart';
import 'package:selfcare/model/treatment_item.dart';
import 'package:selfcare/model/treatment_plan.dart';
import 'package:selfcare/api/network_util.dart';
import 'package:selfcare/model/return_data.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/styles.dart';

class TreatmentBody extends StatefulWidget {
  @override
  _MyTreatmentPageStage createState() => _MyTreatmentPageStage();
}

class _MyTreatmentPageStage extends State<TreatmentBody> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    ReturnData returnData = NetworkUtils.instance.returnData;
    List<TreatmentPlan> treatmentPlans = returnData.treatmentPlans;
    return ListView.builder
      (
        itemCount: treatmentPlans.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(Dimens.smallSpacing),
                child: new Text(treatmentPlans[index].type,  style: CustomStyles.treatmentTitleStyle,),
              ),
              _buildTreatmentPlan(treatmentPlans[index].treatmentItems),
              Divider(color: Colors.grey,)
            ],
          );
        }
    );
  }

  Widget _buildTreatmentPlan(List<TreatmentItem> treatmentItems) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: treatmentItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(Dimens.smallSpacing),
                child: Text(treatmentItems[index].treatmentDescription,style: CustomStyles.descriptionStyle,),
              ),
              _buildTreatments(treatmentItems[index].treatment),
            ],
          );
        }
    );
  }

  Widget _buildTreatments(List<Treatment> treatments) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: treatments.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              Checkbox(
                  value: treatments[index].checked ?? false,
                  onChanged: (bool newValue) {
            setState(() {
              treatments[index].checked = newValue;
            });
          },),
              Text(treatments[index].description),
            ],
          );
        }
    );
  }
}