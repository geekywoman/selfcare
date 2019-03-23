import 'package:flutter/material.dart';
import 'package:selfcare/api/network_util.dart';
import 'package:selfcare/model/return_data.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/images.dart';
import 'package:selfcare/resources/styles.dart';

class ResultsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ReturnData returnData = NetworkUtils.instance.returnData;
    return Column(
      children: <Widget>[
        _buildResultItem(bloodDropSvg, "Blood tests"),
        _buildResultItem(radioGraphicSvg, "Radiographics"),
        _buildResultItem(measurementSvg, "Measurements"),
        _buildResultItem(avatarSvg, "Self assessment"),
      ],
    );
  }


  Widget _buildResultItem(Widget icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimens.mediumSpacing, right: Dimens.mediumSpacing, top: Dimens.mediumSpacing),
      child: Card(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(Dimens.largeSpacing),
              child: icon,
            ),
            Text(title, style: CustomStyles.treatmentTitleStyle,)
          ],
        ),
      ),
    );
  }
}
