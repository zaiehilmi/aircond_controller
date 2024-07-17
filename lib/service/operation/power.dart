import 'package:flutter/material.dart';

import '../../state/controller_data.dart';

enum Power {
  on,
  off,
}

void turnOnOff() {
  switch (contorllerState.power) {
    case Power.on:
      contorllerState.power = Power.off;
    case Power.off:
      contorllerState.power = Power.on;
  }

  contorllerState.setState();
  debugPrint('Power: ${contorllerState.power}');
}
