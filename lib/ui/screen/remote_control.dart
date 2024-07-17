import 'package:flutter/material.dart';
import 'package:izone_interview/ui/widget/remote_screen.dart';

import '../widget/remote_buttons.dart';

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
