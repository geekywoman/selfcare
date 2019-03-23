import 'package:flutter/material.dart';
import 'package:selfcare/api/network_util.dart';
import 'package:selfcare/model/return_data.dart';
import 'package:selfcare/resources/colors.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/images.dart';
import 'package:selfcare/resources/styles.dart';

class ResultsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ReturnData returnData = NetworkUtils.instance.returnData;
    return Column(
      children: <Widget>[
        _buildResultItem(bloodDropSvg, "Blood tests", true),
        _buildResultItem(radioGraphicSvg, "Radiographics", false),
        _buildResultItem(measurementSvg, "Measurements", false),
        _buildResultItem(avatarSvg, "Self assessment", false),
      ],
    );
  }


  Widget _buildResultItem(Widget icon, String title, bool newTest) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimens.mediumSpacing, right: Dimens.mediumSpacing, top: Dimens.mediumSpacing),
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
                Text(title, style: CustomStyles.treatmentTitleStyle,),

              ],
            ),
            Visibility(
              visible: newTest,
              child: Container(
                margin: const EdgeInsets.only(
                    right: Dimens.mediumSpacing),
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
    );
  }
}
