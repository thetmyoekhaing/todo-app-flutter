import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/model/task_model.dart';
import 'package:todo_project/model/colors.dart';
import 'package:http/http.dart' as http;

class Task extends StatefulWidget {
  final TaskModel task;
  const Task({super.key, required this.task});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    final lists = Provider.of<ListTask>(context);
    final time = widget.task.date.split(' ');

    return Dismissible(
      key: GlobalKey(),
      background: Container(
        color: Colors.green,
        child: const Icon(Icons.my_library_books_outlined),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: const Icon(Icons.lock_clock_outlined),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          bool confirmDone = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Done Task?'),
                content: const Text('Are you sure this task is done?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: const Text('Done'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            },
          );
          if (confirmDone == true) {
            setState(() {
              widget.task.userSelectColor = green;
              lists.complete();
            });
            return true;
          } else {
            return false;
          }
        } else if (direction == DismissDirection.endToStart) {
          bool confirmDelete = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Delete Task?'),
                content:
                    const Text('Are you sure you want to delete this task?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: const Text('Delete'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            },
          );
          if (confirmDelete == true) {
            lists.removeTask(id: widget.task.taskId);
            return true;
          } else {
            return false;
          }
        }
        return null;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          time[0],
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        Text(
                          time[1],
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        )
                      ],
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.task.taskName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.task.description),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: Icon(Icons.star_border),
                        onPressed: () {
                          // print("clicked");
                          // var res = await http.get(Uri.parse(
                          //     "https://random.imagecdn.app/v1/image?width=500&height=500&category=people"));
                          // print(res.headers);
                          // print(res.statusCode);
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        lists.getID();
                      },
                      icon: const Icon(Icons.circle),
                      color: widget.task.userSelectColor,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
