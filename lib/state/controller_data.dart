import '../service/operation/fan_speed.dart';
import '../service/operation/mode.dart';
import '../service/operation/power.dart';
import 'package:june/june.dart';

class ControllerData extends JuneState {
  int currentTemp = 18;
  AircondMode aircondMode = AircondMode.cool;
  FanSpeed fanSpeed = FanSpeed.auto;
  Power power = Power.off;
}

final contorllerState = June.getState(() => ControllerData());
