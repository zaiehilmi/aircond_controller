import 'package:aircond_remote/service/request_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../state/controller_data.dart';

enum FanSpeed {
  low(displayName: 'LOW'),
  medium(displayName: 'MEDIUM'),
  high(displayName: 'HIGH'),
  auto(displayName: 'AUTO');

  final String displayName;
  const FanSpeed({required this.displayName});
}

void switchFanSpeed() async {
  switch (controllerState.fanSpeed) {
    case FanSpeed.low:
      controllerState.fanSpeed = FanSpeed.medium;
      break;
    case FanSpeed.medium:
      controllerState.fanSpeed = FanSpeed.high;
      break;
    case FanSpeed.high:
      controllerState.fanSpeed = FanSpeed.auto;
      break;
    case FanSpeed.auto:
      controllerState.fanSpeed = FanSpeed.low;
      break;
  }

  final fanSpeedIndex = controllerState.fanSpeed.index + 1;
  final requestBody = ApiRequestBody(cmd: Command.fanSpeed, value: fanSpeedIndex);
  final res = await requestApi(requestBody);

  if (res) {
    controllerState.setState();

    Fluttertoast.showToast(
      msg: '${requestBody.cmd.displayName} set to ${controllerState.fanSpeed.displayName}',
      backgroundColor: Colors.lightBlue.shade600,
    );
  }
}
