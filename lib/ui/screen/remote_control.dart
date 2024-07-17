import 'package:flutter/material.dart';

import '../widget/remote_buttons.dart';
import '../widget/remote_screen.dart';

class RemoteControl extends StatelessWidget {
  const RemoteControl({super.key});

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
