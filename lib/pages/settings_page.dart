import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfcare/pages/login_page.dart';
import 'package:selfcare/resources/colors.dart';
import 'package:selfcare/resources/dimens.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.mediumSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              child: Text('Logout'),
              textColor: Colors.white,
              color: CustomColors.accentColor,
              splashColor: CustomColors.accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.radius)),
              padding: const EdgeInsets.all(Dimens.smallSpacing),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
