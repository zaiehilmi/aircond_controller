import 'dart:convert';

import 'package:aircond_remote/service/operation/fan_speed.dart';
import 'package:aircond_remote/service/operation/mode.dart';
import 'package:aircond_remote/state/controller_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'operation/power.dart';

enum Command {
  systemPower(settingCode: 'SysOn', displayName: 'Power'),
  fanSpeed(settingCode: 'SysFan', displayName: 'Fan speed'),
  mode(settingCode: 'SysMode', displayName: 'Mode'),
  temperaturePoint(settingCode: 'SysSetpoint', displayName: 'Temperature');

  final String settingCode;
  final String displayName;

  const Command({required this.settingCode, required this.displayName});
}

class ApiRequestBody {
  Command cmd;
  int value;

  ApiRequestBody({required this.cmd, required this.value});
}

Future<bool> requestApi(ApiRequestBody requestBody, {bool isQuery = false}) async {
  try {
    final url = Uri.https('api.izone.com.au', '/testsimplelocalcocb');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        (!isQuery)
            ? {
                requestBody.cmd.settingCode: requestBody.value,
              }
            : {
                "iZoneV2Request": {
                  "Type": 1,
                  "No": 0,
                  "No1": 0,
                }
              },
      ),
    );
    debugPrint(response.body);

    if (isQuery) {
      _fetchData(response.body);
    }

    if (response.statusCode == 200) {
      if (response.body == '{OK}') {
        return true;
      } else {
        return false;
      }
    } else {
      debugPrint('Error with response code ${response.statusCode}');
      return false;
    }
  } catch (e) {
    throw Exception('Ada masalah untuk mendapatkan respon: $e');
  }
}

void _fetchData(String body) {
  final data = jsonDecode(body);

  controllerState.power = Power.values[data[Command.systemPower.settingCode]];
  controllerState.aircondMode = AircondMode.values[data[Command.mode.settingCode] - 1];
  controllerState.fanSpeed = FanSpeed.values[data[Command.fanSpeed.settingCode] - 1];
  controllerState.currentTemp = (data['Setpoint'] / 100).toInt();

  controllerState.setState();
}
