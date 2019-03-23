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
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    ReturnData returnData = NetworkUtils.instance.returnData;
    List<TreatmentPlan> treatmentPlans = returnData.treatmentPlans;
    treatmentPlans = _preCheckAllDataExceptFurosemide(treatmentPlans);
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
          width: Dimens.logoIconSize,
          height: 100.0,
          child: Visibility(
            child: FlareActor(
              "assets/trophee.flr",
              alignment: Alignment.center,
              fit: BoxFit.fitWidth,
              animation: "animation",
            ),
            visible: _areAllTreatmentChecked(treatmentPlans),
          ),
        ),
        _buildTreatmentPlans(treatmentPlans),
      ],
    );
  }

  bool _areAllTreatmentChecked(List<TreatmentPlan> treatmentPlans) {
    bool result = true;
    treatmentPlans.forEach((treatmentPlan) {
      treatmentPlan.treatmentItems.forEach((treatmentItem) {
        treatmentItem.treatment.forEach((treatment) {
          result &= treatment.checked;
        });
      });
    });
    return result;
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
          TreatmentItem treatmentItem = treatmentItems[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(Dimens.smallSpacing),
                child: Text(
                  treatmentItem.treatmentDescription,
                  style: CustomStyles.descriptionStyle,
                ),
              ),
              _buildTreatments(
                  treatmentItem.treatment, treatmentItem.treatmentType),
            ],
          );
        });
  }

  Widget _buildTreatments(List<Treatment> treatments, String treatmentType) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: treatments.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildTreatmentItem(treatments[index], treatmentType);
        });
  }

  Widget _buildTreatmentItem(Treatment treatment, String treatmentType) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) =>
                      TreatmentDetailsPage(treatment, treatmentType)));
        },
        child: Container(
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
        ),
      ),
    );
  }

  String getDate() {
    DateTime now = DateTime.now();
    return DateFormat('EEEE dd.MM.yyyy').format(now);
  }

  //todo for demo purpose only, delete me after the hackathon
  List<TreatmentPlan> _preCheckAllDataExceptFurosemide(
      List<TreatmentPlan> treatmentPlans) {
    List<TreatmentPlan> treatmentPlansPreChecked = List();
    treatmentPlans.forEach((treatmentPlan) {
      treatmentPlan.treatmentItems.forEach((treatmentItem) {
        treatmentItem.treatment.forEach((treatment) {
          if (treatment.description != 'Furosemide') {
            treatment.checked = true;
          }
        });
      });
      treatmentPlansPreChecked.add(treatmentPlan);
    });
    return treatmentPlansPreChecked;
  }
}
