import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

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

    void setEditMode(bool boolValue) {
      setState(() {
        isEditModeOpen = boolValue;
        print("$isEditModeOpen 1");
      });
    }

    return SizedBox(
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
                        child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              onDoubleTap: () {
                                setEditMode(true);
                              },

                              /* 
                                TO-DO: debug the child.. 
                                -- doesn't rebuild with the new value of [isEditModeMode]
                              */
                              child: !isEditModeOpen
                                  ? Text(widget.todoList[index].todoText)
                                  : const Text("Editing mode"),
                            )),
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              // TO-DO: check todo
                              widget.checkTodo(widget.todoList[index]);
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
                            // TO-DO: drop down menu
                            child: const Icon(Icons.settings),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
