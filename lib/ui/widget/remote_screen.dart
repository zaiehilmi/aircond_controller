import 'package:flutter/material.dart';
import 'package:izone_interview/service/operation/power.dart';
import 'package:izone_interview/state/controller_data.dart';
import 'package:izone_interview/ui/theme/typography.dart';
import 'package:izone_interview/util/dimension.dart';
import 'package:june/june.dart';

Widget RemoteScreen(BuildContext context) {
  return JuneBuilder(
    () => ControllerData(),
    builder: (vm) => Container(
      height: deviceHeight(context) / 4,
      width: deviceWidth(context) / 1.2,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black26),
        color: (vm.power == Power.on) ? Colors.blue.shade100 : Colors.blueGrey.shade100,
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LeftDisplay(context),
          VerticalDivider(color: Colors.blue.shade900),
          DisplayTemperature(context),
        ],
      ),
    ),
  );
}

Widget LeftDisplay(BuildContext context) {
  return JuneBuilder(
    () => ControllerData(),
    builder: (vm) => Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          vm.aircondMode.displayName,
          style: typography(context).titleLarge,
        ),
        Container(
          color: Colors.blue.shade800,
          width: 110,
          height: 1,
        ),
        DisplayFanSpeed(context)
      ],
    ),
  );
}

Widget DisplayFanSpeed(BuildContext context) {
  return JuneBuilder(
    () => ControllerData(),
    builder: (vm) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/fan.png'),
        const SizedBox(width: 15),
        SizedBox(width: 60, child: Text(vm.fanSpeed.displayName)),
      ],
    ),
  );
}

Widget DisplayTemperature(BuildContext context) {
  return JuneBuilder(
    () => ControllerData(),
    builder: (vm) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Set to',
          style: typography(context).titleMedium,
        ),
        SizedBox(
          width: 125,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${vm.currentTemp}',
                style: typography(context).displayLarge,
              ),
              const Text(
                '℃',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
