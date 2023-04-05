import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0XFFf2f2f2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(4, (index) {
                return Text("todo #${index + 1}");
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
