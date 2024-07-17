import 'package:flutter/material.dart';
import 'package:izone_interview/service/operation/fan_speed.dart';
import 'package:izone_interview/service/operation/mode.dart';
import 'package:izone_interview/service/operation/power.dart';

import '../../service/operation/temperature.dart';

Widget RemoteButtons() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _powerButton(),
      const SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
// Mode
          IconButton.outlined(
            iconSize: 35,
            onPressed: () {
              switchAircondMode();
            },
            icon: const Icon(Icons.ac_unit_rounded),
          ),
          _temperatureSetting(),

// Kelajuan Kipas
          IconButton.outlined(
            iconSize: 35,
            onPressed: () {
              switchFanSpeed();
            },
            icon: Image.asset(
              'assets/fan.png',
              width: 35,
            ),
          ),
        ],
      )
    ],
  );
}

Widget _powerButton() => IconButton.filled(
      iconSize: 45,
      onPressed: () {
        turnOnOff();
      },
      icon: const Icon(Icons.power_settings_new),
    );

Widget _temperatureSetting() => Column(
      children: [
        ElevatedButton(
          onPressed: () {
            increaseTemp();
          },
          child: const Icon(
            Icons.arrow_drop_up_rounded,
            size: 50,
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            decreaseTemp();
          },
          child: const Icon(
            Icons.arrow_drop_down,
            size: 50,
          ),
        ),
      ],
    );
