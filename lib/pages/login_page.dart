import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfcare/pages/my_treatment_page.dart';
import 'package:selfcare/resources/colors.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/images.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.largeSpacing),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[logoSvg, _buildLoginButton()],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          splashColor: CustomColors.accentColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.radius)),
          padding: const EdgeInsets.all(Dimens.smallSpacing),
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  )),
              Visibility(
                visible: _isLoading,
                child: Align(
                  alignment: Alignment(0.25, 0.0),
                  child: Container(
                      margin: const EdgeInsets.only(left: Dimens.smallSpacing),
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                      )),
                ),
              ),
            ],
          ),
          textColor: Colors.white,
          color: CustomColors.accentColor,
          onPressed: _isLoading
              ? null
              : () {
                  _login();
                },
        ),
      ],
    );
  }

  void _login() {
    setState(() {
      _isLoading = true;
    });

    //todo network call
    Timer(new Duration(milliseconds: 500), () {
      _navigateToMyTreatment();
    });
  }

  void _navigateToMyTreatment() {
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => MyTreatmentPage()));
  }
}
