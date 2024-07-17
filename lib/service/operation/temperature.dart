import 'package:flutter/material.dart';
import 'package:izone_interview/state/controller_data.dart';

const int _maxTemp = 30;
const int _minTemp = 15;

void increaseTemp() {
  if (contorllerState.currentTemp < _maxTemp) {
    contorllerState.currentTemp += 1;
    contorllerState.setState();
  } else {
    debugPrint('reach limit');
  }

  debugPrint('Suhu semasa: ${contorllerState.currentTemp}');
}

void decreaseTemp() {
  if (contorllerState.currentTemp > _minTemp) {
    contorllerState.currentTemp -= 1;
    contorllerState.setState();
  } else {
    debugPrint('reach limit');
  }

  debugPrint('Suhu semasa: ${contorllerState.currentTemp}');
}
