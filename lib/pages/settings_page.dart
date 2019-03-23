import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfcare/pages/login_page.dart';
import 'package:selfcare/resources/colors.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/styles.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _switchOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.mediumSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[_buildNotifications(), _buildLogoutButton()],
        ),
      ),
    );
  }

  Widget _buildNotifications() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(Dimens.smallSpacing),
          child: Column(
            children: <Widget>[
              Text(
                'Notifications',
                style: CustomStyles.treatmentTitleStyle,
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'General',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  _buildSwitch()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Medicine',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  _buildSwitch()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Excercice',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  _buildSwitch()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Appointments',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  _buildSwitch()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton() {
    return RaisedButton(
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
    );
  }

  Widget _buildSwitch() {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoSwitch(
            activeColor: CustomColors.accentColor,
            value: _switchOn,
            onChanged: (bool value) {
              //todo
            },
          )
        : Switch(
            activeColor: CustomColors.accentColor,
            value: _switchOn,
            onChanged: (bool value) {
              //todo
            },
          );
  }
}
