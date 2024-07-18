import 'package:flutter/material.dart';

import '../../state/controller_data.dart';

enum Power {
  on,
  off,
}

void turnOnOff() {
  switch (controllerState.power) {
    case Power.on:
      controllerState.power = Power.off;
    case Power.off:
      controllerState.power = Power.on;
  }

  controllerState.setState();
  debugPrint('Power: ${controllerState.power}');
}
