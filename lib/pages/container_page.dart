import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selfcare/pages/body/appointment_body.dart';
import 'package:selfcare/pages/body/chat_body.dart';
import 'package:selfcare/pages/body/history_body.dart';
import 'package:selfcare/pages/body/results_body.dart';
import 'package:selfcare/pages/settings_page.dart';
import 'package:selfcare/resources/colors.dart';
import 'package:selfcare/resources/images.dart';
import 'package:selfcare/widgets/bottom_app_bar.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  static List<BottomAppBarItem> _bottomBarItems = [
    BottomAppBarItem(svgPath: menuMyTreatmentSvgPath, title: 'Treatment'),
    BottomAppBarItem(svgPath: menuAppointmentsSvgPath, title: 'Appointments'),
    BottomAppBarItem(svgPath: menuClinicalResultsSvgPath, title: 'Results'),
    BottomAppBarItem(svgPath: menuMedicalHistorySvgPath, title: 'History'),
    BottomAppBarItem(svgPath: menuChatSvgPath, title: 'Chat'),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bottomBarItems[_selectedIndex].title),
        actions: <Widget>[
          Visibility(
            child: IconButton(
                icon: settingsSvg,
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => SettingsPage()));
                }),
            visible: _selectedIndex == 0,
          )
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: CustomBottomAppBar(
        color: Colors.grey,
        selectedColor: CustomColors.accentColor,
        onTabSelected: _selectedTab,
        items: _bottomBarItems,
      ),
    );
  }

  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 1:
        return _buildAppointmentsBody();
      case 2:
        return _buildResultsBody();
      case 3:
        return _buildHistoryBody();
      case 4:
        return _buildChatBody();
      case 0:
      default:
        return _buildTreatmentBody();
    }
  }

  Widget _buildTreatmentBody() {
    return null;
  }

  Widget _buildAppointmentsBody() {
    return AppointmentBody();
  }

  Widget _buildResultsBody() {
    return ResultsBody();
  }

  Widget _buildHistoryBody() {
    return HistoryBody();
  }

  Widget _buildChatBody() {
    return ChatBody();
  }
}
