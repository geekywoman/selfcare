import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:selfcare/model/bloodwork_data.dart';
import 'package:selfcare/pages/blood_test_details_page.dart';
import 'package:selfcare/resources/colors.dart';
import 'package:selfcare/resources/dimens.dart';

class BloodTestListPage extends StatefulWidget {
  final List<BloodWorkData> bloodworksData;

  const BloodTestListPage(this.bloodworksData);

  @override
  _BloodTestListState createState() => _BloodTestListState();
}

class _BloodTestListState extends State<BloodTestListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood tests'),
      ),
      body: _buildBody(),
    );
  }

  /// List of blood tests the user has gone to in the past.
  /// Has a purple dot the the blood test data is new
  Widget _buildBody() {
    List<BloodWorkData> data = widget.bloodworksData;
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildResultItem(data[index], true);
        });
  }

  /// List item for blood tests
  Widget _buildResultItem(BloodWorkData data, bool newTest) {
    String dateFormatted =
        DateFormat('dd.MM.yy').format(DateTime.parse(data.testDate));
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => BloodTestDetailsPage(
                    data.results, '${data.labName} - $dateFormatted')));
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(Dimens.mediumSpacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(data.labName),
                Container(
                    margin: const EdgeInsets.only(left: Dimens.mediumSpacing),
                    child: Text(dateFormatted)),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
