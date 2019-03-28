import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:intl/intl.dart';
import 'package:selfcare/api/network_util.dart';
import 'package:selfcare/model/appointment_data.dart';
import 'package:selfcare/resources/dimens.dart';
import 'package:selfcare/resources/styles.dart';

class AppointmentBody extends StatefulWidget {
  @override
  _AppointmentBodyState createState() => _AppointmentBodyState();
}

class _AppointmentBodyState extends State<AppointmentBody> {
  @override
  Widget build(BuildContext context) {
    List<AppointmentData> appointments =
        NetworkUtils.instance.returnData.appointmentData;
    return Column(
      children: <Widget>[
        Calendar(
          isExpandable: true,
        ),
        _buildAppointmentList(appointments),
      ],
    );
  }

  /// A list of all future appointments
  Widget _buildAppointmentList(List<AppointmentData> appointments) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: appointments.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.smallSpacing,
                              bottom: Dimens.tinySpacing,
                              right: Dimens.smallSpacing),
                          child: Text(
                            DateFormat('dd.MM.yy').format(DateTime.parse(
                                appointments[index].appointmentTime)),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: Dimens.smallSpacing),
                          child: Text(
                            DateFormat('Hm').format(DateTime.parse(
                                appointments[index].appointmentTime)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Dimens.smallSpacing),
                      child: Text(
                        appointments[index].location,
                        style: CustomStyles.appointmentStyle,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                )
              ],
            );
          }),
    );
  }
}
