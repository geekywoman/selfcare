import 'package:flutter/material.dart';
import 'package:selfcare/model/treatment.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/images.dart';

const String fureosemideInfo =
    'Furosemide is a loop diuretic (water pill) that prevents your body from absorbing too much salt. This allows the salt to instead be passed in your urine. Furosemide is used to treat fluid retention (edema) in people with congestive heart failure, liver disease, or a kidney disorder such as nephrotic syndrome.Furosemide is also used to treat high blood pressure (hypertension).';

class TreatmentDetailsPage extends StatelessWidget {
  final Treatment treatment;
  final String treatmentType;

  const TreatmentDetailsPage(this.treatment, this.treatmentType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(treatment.description),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.mediumSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildImageHeader(),
            _buildDescription(),
            Container(
              margin: const EdgeInsets.only(top: Dimens.mediumSpacing),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            _buildMoreInfo()
          ],
        ),
      ),
    );
  }

  Widget _buildImageHeader() {
    return Container(
        margin: const EdgeInsets.only(top: Dimens.mediumSpacing),
        child: medicineSvg);
  }

  Widget _buildDescription() {
    return Container(
      margin: const EdgeInsets.only(top: Dimens.mediumSpacing),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.tinySpacing),
            child: Row(
              children: <Widget>[
                Text(
                  '- Name: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(treatment.description)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.tinySpacing),
            child: Row(
              children: <Widget>[
                Text(
                  '- Type: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(treatmentType)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.tinySpacing),
            child: Row(
              children: <Widget>[
                Text(
                  '- Form: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(treatment.form)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.tinySpacing),
            child: Row(
              children: <Widget>[
                Text(
                  '- Strength: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(treatment.strength.toString())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.tinySpacing),
            child: Row(
              children: <Widget>[
                Text(
                  '- Strength unit: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(treatment.strengthUnit)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.tinySpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '- Instructions: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: Dimens.tinySpacing),
                  child: Text(
                    treatment.instructions,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMoreInfo() {
    return Container(
      margin: const EdgeInsets.only(top: Dimens.mediumSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'What is ${treatment.description}?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: Dimens.smallSpacing),
            child: Text(treatment.description == 'Furosemide'
                ? fureosemideInfo
                : 'No information for the moment.'),
          )
        ],
      ),
    );
  }
}
