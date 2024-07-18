import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../state/controller_data.dart';
import '../request_api.dart';

const int _maxTemp = 30;
const int _minTemp = 15;

Future<void> adjustTemp({required bool increase}) async {
  if (increase && controllerState.currentTemp < _maxTemp) {
    controllerState.currentTemp += 1;
  } else if (!increase && controllerState.currentTemp > _minTemp) {
    controllerState.currentTemp -= 1;
  } else {
    debugPrint('reach limit');
    return;
  }

  controllerState.setState();
  final temperature = controllerState.currentTemp * 100;
  final requestBody = ApiRequestBody(cmd: Command.temperaturePoint, value: temperature);
  final res = await requestApi(requestBody);

  if (res) {
    controllerState.setState();
    Fluttertoast.showToast(
      msg: '${requestBody.cmd.displayName} set to ${controllerState.currentTemp}',
      backgroundColor: Colors.lightBlue.shade600,
    );
  } else {
    Fluttertoast.showToast(
      msg: 'Failed to update',
      backgroundColor: Colors.red.shade600,
    );
  }

  debugPrint('Suhu semasa: ${controllerState.currentTemp}');
}

void increaseTemp() async {
  await adjustTemp(increase: true);
}

void decreaseTemp() async {
  await adjustTemp(increase: false);
}
