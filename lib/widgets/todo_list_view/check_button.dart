import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class CheckButton extends StatelessWidget {
  final Function checkTodo;
  final TodoModel todo;
  const CheckButton({super.key, required this.checkTodo, required this.todo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            // TO-DO: check todo
            checkTodo(todo);
          },
          child: const Icon(Icons.check_rounded),
        ),
      ),
    );
  }
}
