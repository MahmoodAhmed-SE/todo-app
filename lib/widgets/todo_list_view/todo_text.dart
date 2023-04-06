import 'package:flutter/material.dart';

import '../../models/todo_model.dart';

class TodoText extends StatefulWidget {
  final TodoModel todo;
  final Function editTodoText;
  const TodoText({super.key, required this.todo, required this.editTodoText});

  @override
  State<TodoText> createState() => _TodoTextState();
}

class _TodoTextState extends State<TodoText> {
  bool isEditModeOpen = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onDoubleTap: () {
          setState(() {
            isEditModeOpen = true;
          });
        },
        child: SizedBox(
          child: showText(),
        ),
      ),
    );
  }

  Widget showText() {
    final TextEditingController editingTodoTextController =
        TextEditingController();

    editingTodoTextController.text = widget.todo.todoText;
    return !isEditModeOpen
        ? Text(widget.todo.todoText)
        : TextField(
            autofocus: true,
            onSubmitted: (String value) {
              widget.editTodoText(widget.todo, value);
              editingTodoTextController.clear();
              setState(
                () {
                  isEditModeOpen = false;
                },
              );
            },
            controller: editingTodoTextController,
          );
  }
}
