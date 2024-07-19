import 'dart:async';

import 'package:aircond_remote/service/request_api.dart';
import 'package:flutter/material.dart';

import '../widget/remote_buttons.dart';
import '../widget/remote_screen.dart';

const Duration pollingInterval = Duration(seconds: 30);

class RemoteControl extends StatefulWidget {
  const RemoteControl({super.key});

  @override
  State<RemoteControl> createState() => _RemoteControlState();
}

class _RemoteControlState extends State<RemoteControl> {
  Timer? _timer;

  @override
  void initState() {
    // jalankan pertama kali
    requestApi(
      ApiRequestBody(cmd: Command.fanSpeed, value: 0),
      isQuery: true,
    );

    // jalankan setiap beberapa ketika
    _timer = Timer.periodic(
      pollingInterval,
      (timer) async => await requestApi(
        ApiRequestBody(cmd: Command.fanSpeed, value: 0),
        isQuery: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 140),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                RemoteScreen(context),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/logo-daikin.png',
                  width: 100,
                ),
              ],
            ),
            RemoteButtons(),
          ],
        ),
      ),
    );
  }
}
