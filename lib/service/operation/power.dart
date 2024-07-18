import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../state/controller_data.dart';
import '../request_api.dart';

enum Power { off, on }

void turnOnOff() async {
  switch (controllerState.power) {
    case Power.on:
      controllerState.power = Power.off;
    case Power.off:
      controllerState.power = Power.on;
  }

  final powerIndex = controllerState.power.index;
  final requestBody = ApiRequestBody(cmd: Command.systemPower, value: powerIndex);
  final res = await requestApi(requestBody);

  if (res) {
    controllerState.setState();

    Fluttertoast.showToast(
      msg: '${requestBody.cmd.displayName} set to ${controllerState.power.name}',
      backgroundColor: Colors.lightBlue.shade600,
    );
  } else {
    Fluttertoast.showToast(
      msg: 'Failed to update',
      backgroundColor: Colors.red.shade600,
    );
  }
}
