import 'package:flutter/material.dart';
import 'package:todo_app/screen/homepage_screen.dart';

void main() {
  runApp(const TodoApp());
}


class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "todo app",
      home: HomepageScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}