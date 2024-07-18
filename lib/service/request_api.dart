import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    debugPrint('Response body: ${response.body}');

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
    throw Exception('Ada masalah untuk mendapatkan respon');
  }
}
