import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selfcare/resources/dimens.dart';

Widget logoSvg = SvgPicture.asset(
  'assets/logo.svg',
  height: Dimens.logoIconSize,
);

Widget settingsSvg = SvgPicture.asset(
  'assets/settings.svg',
  height: Dimens.smallIconSize,
);

Widget medicineSvg = SvgPicture.asset(
  'assets/medicine.svg',
  height: 200.0,
);

String menuMyTreatmentSvgPath = 'assets/menu/menu_my_treatment.svg';
String menuAppointmentsSvgPath = 'assets/menu/menu_appointment.svg';
String menuClinicalResultsSvgPath = 'assets/menu/menu_clinical_result.svg';
String menuMedicalHistorySvgPath = 'assets/menu/menu_medical_history.svg';
String menuChatSvgPath = 'assets/menu/menu_chat.svg';
