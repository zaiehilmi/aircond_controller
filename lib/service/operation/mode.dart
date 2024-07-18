import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../state/controller_data.dart';
import '../request_api.dart';

enum AircondMode {
  cool(displayName: 'Cool'),
  heat(displayName: 'Heat'),
  vent(displayName: 'Vent'),
  dry(displayName: 'Dry');

  final String displayName;
  const AircondMode({required this.displayName});
}

void switchAircondMode() async {
  switch (controllerState.aircondMode) {
    case AircondMode.cool:
      controllerState.aircondMode = AircondMode.heat;
      break;
    case AircondMode.heat:
      controllerState.aircondMode = AircondMode.vent;
      break;
    case AircondMode.vent:
      controllerState.aircondMode = AircondMode.dry;
      break;
    case AircondMode.dry:
      controllerState.aircondMode = AircondMode.cool;
      break;
  }

  final modeIndex = controllerState.aircondMode.index + 1;
  final requestBody = ApiRequestBody(cmd: Command.mode, value: modeIndex);
  final res = await requestApi(requestBody);

  if (res) {
    controllerState.setState();

    Fluttertoast.showToast(
      msg: '${requestBody.cmd.displayName} set to ${controllerState.aircondMode.displayName}',
      backgroundColor: Colors.lightBlue.shade600,
    );
  } else {
    Fluttertoast.showToast(
      msg: 'Failed to update',
      backgroundColor: Colors.red.shade600,
    );
  }
}
