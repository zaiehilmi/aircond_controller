import 'package:flutter/material.dart';
import '../../state/controller_data.dart';

const int _maxTemp = 30;
const int _minTemp = 15;

void increaseTemp() {
  if (controllerState.currentTemp < _maxTemp) {
    controllerState.currentTemp += 1;
    controllerState.setState();
  } else {
    debugPrint('reach limit');
  }

  debugPrint('Suhu semasa: ${controllerState.currentTemp}');
}

void decreaseTemp() {
  if (controllerState.currentTemp > _minTemp) {
    controllerState.currentTemp -= 1;
    controllerState.setState();
  } else {
    debugPrint('reach limit');
  }

  debugPrint('Suhu semasa: ${controllerState.currentTemp}');
}
