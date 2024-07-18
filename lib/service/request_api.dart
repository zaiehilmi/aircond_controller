import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

enum Command {
  systemPower(settingCode: 'SysOn'),
  fanSpeed(settingCode: 'SysFan'),
  mode(settingCode: 'SysMode'),
  temperaturePoint(settingCode: 'SysSetpoint');

  final String settingCode;
  const Command({required this.settingCode});
}

class ApiRequestBody {
  Command cmd;
  int value;

  ApiRequestBody({required this.cmd, required this.value});
}

Future<bool> requestApi(ApiRequestBody requestBody) async {
  try {
    final url = Uri.https('api.izone.com.au', '/testsimplelocalcocb');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({requestBody.cmd.settingCode: requestBody.value}),
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
