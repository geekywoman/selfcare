import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  BottomAppBarItem _selectedItem = _bottomBarItems[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedItem.title),
        actions: <Widget>[
          _selectedItem == _bottomBarItems[0]
              ? IconButton(
                  icon: settingsSvg,
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => SettingsPage()));
                  })
              : null
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
      Fimber.d('tab selected: $index');
      _selectedItem = _bottomBarItems[index];
      _selectedItem.title = _bottomBarItems[index].title;
    });
  }

  Widget _buildBody() {
    Fimber.d('_buildBody');
    return Text(_selectedItem.title);
  }
}
