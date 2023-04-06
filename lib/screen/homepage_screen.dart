import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/widgets/todo_list_view/todo_list_view.dart';

import '../widgets/todo_list_item_adder/todo_list_item_adder.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final List<TodoModel> _todoList = [
    TodoModel(todoText: "Cooking"),
    TodoModel(todoText: "Studying"),
    TodoModel(todoText: "Sleeping"),
  ];
  final List<TodoModel> _removedItemsList = [];

  void checkTodo(TodoModel todo) {
    setState(() {
      _todoList[_todoList.indexOf(todo)] = TodoModel(todoText: todo.todoText, isChecked: true);
      _removedItemsList.add(todo);
    });
  }

  void addTodo(String todoText) {
    setState(() {
      _todoList.add(TodoModel(todoText: todoText));
    });
  }

  void editTodo({required TodoModel todo, required String editedText}) {
    setState(() {
      _todoList[_todoList.indexOf(todo)] = TodoModel(todoText: editedText, isChecked: todo.isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 1000),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.all(10),
          color: const Color(0XFFf2f2f2),
          child: Column(
            children: [
              TodoListItemAdder(addTodo: addTodo),
              TodoListView(
                todoList: _todoList,
                checkTodo: checkTodo,
                editTodo: editTodo,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
