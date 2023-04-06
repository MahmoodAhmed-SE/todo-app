import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          // TO-DO: drop down menu
          borderRadius: BorderRadius.circular(10),
          child: const Icon(Icons.settings),
        ),
      ),
    );
  }
}
