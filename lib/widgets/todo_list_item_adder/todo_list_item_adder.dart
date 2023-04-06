import 'package:flutter/material.dart';

class TodoListItemAdder extends StatefulWidget {
  final Function addTodo;
  const TodoListItemAdder({super.key, required this.addTodo});

  @override
  State<TodoListItemAdder> createState() => _TodoListItemAdderState();
}

class _TodoListItemAdderState extends State<TodoListItemAdder> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController todoTextInputController =
        TextEditingController();

    return Container(
      height: 100,
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 250,
            height: 40,
            child: TextField(
              onSubmitted: (String todoText) {
                widget.addTodo(todoText);
                todoTextInputController.clear();
              },
              controller: todoTextInputController,
            ),
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    widget.addTodo(todoTextInputController.text);
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: const Icon(Icons.add),
                )),
          )
        ],
      ),
    );
  }
}
