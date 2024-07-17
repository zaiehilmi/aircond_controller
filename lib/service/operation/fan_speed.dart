import 'package:flutter/material.dart';

import '../../state/controller_data.dart';

enum FanSpeed {
  low(displayName: 'LOW'),
  medium(displayName: 'MEDIUM'),
  high(displayName: 'HIGH'),
  auto(displayName: 'AUTO');

  final String displayName;
  const FanSpeed({required this.displayName});
}

void switchFanSpeed() {
  switch (contorllerState.fanSpeed) {
    case FanSpeed.low:
      contorllerState.fanSpeed = FanSpeed.medium;
      break;
    case FanSpeed.medium:
      contorllerState.fanSpeed = FanSpeed.high;
      break;
    case FanSpeed.high:
      contorllerState.fanSpeed = FanSpeed.auto;
      break;
    case FanSpeed.auto:
      contorllerState.fanSpeed = FanSpeed.low;
      break;
  }
  contorllerState.setState();
  debugPrint('Fan Speed: ${contorllerState.fanSpeed.displayName}');
}
