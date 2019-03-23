import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfcare/api/network_util.dart';
import 'package:selfcare/model/return_data.dart';
import 'package:selfcare/pages/blood_test_list_page.dart';
import 'package:selfcare/resources/colors.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/images.dart';
import 'package:selfcare/resources/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ReturnData returnData = NetworkUtils.instance.returnData;
    return Column(
      children: <Widget>[
        _buildResultItem(bloodDropSvg, "Blood tests", true, false),
        _buildResultItem(radioGraphicSvg, "Radiographics", false, false),
        _buildResultItem(measurementSvg, "Measurements", false, false),
        _buildResultItem(avatarSvg, "Self assessment", false, true),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          BloodTestListPage(returnData.bloodworksData)));
            },
            child: _buildResultItem(bloodDropSvg, "Blood tests", true)),
        _buildResultItem(radioGraphicSvg, "Radiographics", false),
        _buildResultItem(measurementSvg, "Measurements", false),
        _buildResultItem(avatarSvg, "Self assessment", false),
      ],
    );
  }

  Widget _buildResultItem(Widget icon, String title, bool newTest, bool selfAssessment) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimens.mediumSpacing,
          right: Dimens.mediumSpacing,
          top: Dimens.mediumSpacing),
      child: GestureDetector(
        onTap: () {
          if (!selfAssessment) return;
          _launchURL();
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(Dimens.largeSpacing),
                    child: icon,
                  ),
                  Text(
                    title,
                    style: CustomStyles.treatmentTitleStyle,
                  ),
                ],
              ),
              Visibility(
                visible: newTest,
                child: Container(
                  margin: const EdgeInsets.only(right: Dimens.mediumSpacing),
                  width: Dimens.tinyIconSize,
                  height: Dimens.tinyIconSize,
                  decoration: BoxDecoration(
                    color: CustomColors.accentColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://docs.google.com/forms/d/e/1FAIpQLSfYgxYhBlycVzy2r0j0Pvg2dGQZzfhZOn61n1HhoiRo9eUzUw/viewform';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
