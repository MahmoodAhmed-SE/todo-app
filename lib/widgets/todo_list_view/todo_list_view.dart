import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoListView extends StatelessWidget {
  final List<TodoModel> todoList;
  final Function checkTodo;
  const TodoListView(
      {super.key, required this.todoList, required this.checkTodo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return todoList[index].isChecked
              ? null
              : Container(
                  height: 60,
                  width: 300,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  // color: const Color(0XFF333333),
                  child: Row(children: [
                    Expanded(child: Text(todoList[index].todoText)),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            print("checked the ${todoList[index].todoText}");
                          },
                          child: const Icon(Icons.check_rounded),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            checkTodo(todoList[index]);
                            print(todoList[index].isChecked);
                            print(todoList[index].todoText);
                          },
                          child: const Icon(Icons.settings),
                        ),
                      ),
                    ),
                  ]),
                );
        },
      ),
    );
  }
}
