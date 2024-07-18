import 'package:flutter/material.dart';

import '../../state/controller_data.dart';

enum AircondMode {
  cool(displayName: 'Cool'),
  heat(displayName: 'Heat'),
  vent(displayName: 'Vent'),
  dry(displayName: 'Dry');

  final String displayName;
  const AircondMode({required this.displayName});
}

void switchAircondMode() {
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
  controllerState.setState();
  debugPrint('Aircond Mode: ${controllerState.aircondMode.displayName}');
}
