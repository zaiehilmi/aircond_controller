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
  switch (contorllerState.aircondMode) {
    case AircondMode.cool:
      contorllerState.aircondMode = AircondMode.heat;
      break;
    case AircondMode.heat:
      contorllerState.aircondMode = AircondMode.vent;
      break;
    case AircondMode.vent:
      contorllerState.aircondMode = AircondMode.dry;
      break;
    case AircondMode.dry:
      contorllerState.aircondMode = AircondMode.cool;
      break;
  }
  contorllerState.setState();
  debugPrint('Aircond Mode: ${contorllerState.aircondMode.displayName}');
}
