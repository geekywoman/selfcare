import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfcare/pages/allergy_details_page.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/images.dart';
import 'package:selfcare/resources/styles.dart';

class HistoryBody extends StatefulWidget {
  @override
  _HistoryBodyState createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHistoryItem(vaccineSvg, "Vaccinations"),
        _buildHistoryItem(hospitalSvg, "Encounters"),
        _buildHistoryItem(doctorSvg, "Referals"),
        _buildHistoryItem(allergySvg, "Allergies"),
      ],
    );
  }

  Widget _buildHistoryItem(Widget icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimens.mediumSpacing,
          right: Dimens.mediumSpacing,
          top: Dimens.mediumSpacing),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => AllergyDetailPage()));
        },
        child: Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(Dimens.largeSpacing),
                child: icon,
              ),
              Text(
                title,
                style: CustomStyles.treatmentTitleStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
