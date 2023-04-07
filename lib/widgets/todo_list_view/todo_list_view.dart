import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/widgets/todo_list_view/settings_button.dart';
import 'package:todo_app/widgets/todo_list_view/todo_text.dart';

import 'check_button.dart';

class TodoListView extends StatefulWidget {
  final List<TodoModel> todoList;
  final Function checkTodo;
  final Function editTodo;
  const TodoListView({
    super.key,
    required this.todoList,
    required this.checkTodo,
    required this.editTodo,
  });

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    bool isEditModeOpen = false;

    void editTodoText(TodoModel todo, String editedText) {
      setState(() {
        widget.todoList[widget.todoList.indexOf(todo)] =
            TodoModel(todoText: editedText, time: todo.time);
      });
    }

    return Container(
      color: Colors.black12,
      height: 300,
      child: ListView.builder(
        itemCount: widget.todoList.length,
        itemBuilder: (context, index) {
          return widget.todoList[index].isChecked
              ? null
              : Container(
                  height: 60,
                  width: 300,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  // color: const Color(0XFF333333),
                  child: Row(
                    children: [
                      Expanded(
                        child: TodoText(
                          todo: widget.todoList[index],
                          editTodoText: editTodoText,
                        ),
                      ),
                      CheckButton(
                        todo: widget.todoList[index],
                        checkTodo: widget.checkTodo,
                      ),
                      const SettingsButton(),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
