import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final textcontroller = TextEditingController();

  List todos = [''];
  int currentindex = 0;

  void addToDo() {
    setState(() {
      todos.add(textcontroller.text);
    });
  }

  deleteToDo(numb) {
    setState(() {
      todos.removeAt(numb);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              // ignore: dead_code
              if (index == 0 || todos.isEmpty) {
                return Column(
                  children: [
                    TextField(
                      controller: textcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Add your TODO',
                        labelText: 'Add your TODO',
                        suffixIcon: InkWell(
                          onTap: addToDo,
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Text('$index.'),
                    title: Text(todos[index]),
                    trailing: InkWell(
                      onTap: () {
                        currentindex = index;
                        deleteToDo(currentindex);
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
// TextField(
              //   controller: textcontroller,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: 'Add your TODO',
              //     labelText: 'Add your TODO',
              //     suffixIcon: InkWell(
              //       onTap: addToDo,
              //       child: Icon(Icons.add),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Text("hello"),