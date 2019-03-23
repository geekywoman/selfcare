import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:selfcare/api/network_util.dart';
import 'package:selfcare/model/return_data.dart';
import 'package:selfcare/model/treatment.dart';
import 'package:selfcare/model/treatment_item.dart';
import 'package:selfcare/model/treatment_plan.dart';
import 'package:selfcare/pages/treatment_details_page.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/styles.dart';

class TreatmentBody extends StatefulWidget {
  @override
  _MyTreatmentPageStage createState() => _MyTreatmentPageStage();
}

class _MyTreatmentPageStage extends State<TreatmentBody> {
  bool allChecked = true;

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    ReturnData returnData = NetworkUtils.instance.returnData;
    List<TreatmentPlan> treatmentPlans = returnData.treatmentPlans;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(Dimens.mediumSpacing),
              child: Icon(
                Icons.arrow_back_ios,
                size: Dimens.tinyIconSize,
              ),
            ),
            Text(
              getDate(),
              style: CustomStyles.dateTitle,
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.smallSpacing),
              child: Icon(
                Icons.arrow_forward_ios,
                size: Dimens.tinyIconSize,
              ),
            ),
          ],
        ),
        Container(
            height: 50.0,
            width: 50.0,
            child: FlareActor(
              "assets/Trofeo.flr2d",
              animation: "trophy_animation",
              alignment: Alignment.center,
              fit: BoxFit.contain,
            )),
        _buildTreatmentPlans(treatmentPlans),
      ],
    );
  }

  Widget _buildTreatmentPlans(List<TreatmentPlan> treatmentPlans) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: treatmentPlans.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(Dimens.smallSpacing),
                  child: new Text(
                    treatmentPlans[index].type,
                    style: CustomStyles.treatmentTitleStyle,
                  ),
                ),
                _buildTreatmentItems(treatmentPlans[index].treatmentItems),
                Divider(
                  color: Colors.grey,
                )
              ],
            );
          }),
    );
  }

  Widget _buildTreatmentItems(List<TreatmentItem> treatmentItems) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: treatmentItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(Dimens.smallSpacing),
                child: Text(
                  treatmentItems[index].treatmentDescription,
                  style: CustomStyles.descriptionStyle,
                ),
              ),
              _buildTreatments(treatmentItems[index].treatment),
            ],
          );
        });
  }

  Widget _buildTreatments(List<Treatment> treatments) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: treatments.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildTreatmentItem(treatments[index]);
        });
  }

  Widget _buildTreatmentItem(Treatment treatment) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => TreatmentDetailsPage(treatment)));
      },
      child: Row(
        children: <Widget>[
          Checkbox(
            value: treatment.checked ?? false,
            onChanged: (bool newValue) {
              setState(() {
                treatment.checked = newValue;
              });
            },
          ),
          Text(treatment.description),
        ],
      ),
    );
  }

  String getDate() {
    DateTime now = DateTime.now();
    return DateFormat('EEEE dd.MM.yyyy').format(now);
  }
}
