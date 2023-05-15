import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/components/icon_button.dart';
import 'package:todo_project/components/input.dart';
import 'package:todo_project/model/colors.dart';
import 'package:todo_project/model/task_model.dart';

class TaskAddScreen extends StatefulWidget {
  final TaskModel? task;
  const TaskAddScreen({Key? key, this.task}) : super(key: key);

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {
  Color? priority;
  final nameController = TextEditingController();

  final descController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  TimeOfDay timeOfDay = TimeOfDay.now();

  void timePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        timeOfDay = value!;
        timeController.text = timeOfDay.format(context).toString();
      });
    });
  }

  void addNewTask({required BuildContext context}) {
    final provider = Provider.of<ListTask>(context, listen: false);
    provider.addTodoItem(
        task: TaskModel(
            userSelectColor: priority,
            taskId: Random.secure().nextInt(5),
            taskName: nameController.text,
            description: descController.text,
            date: timeOfDay.format(context).toString()));
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.task?.taskName ?? "";
    descController.text = widget.task?.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Task")),
      body: Column(
        children: [
          Input(controller: nameController, placeholder: "Name"),
          Input(controller: descController, placeholder: "Description"),
          Input(
            controller: timeController,
            timeOfDay: timeOfDay,
            placeholder: "Pick Date and Time",
            onTapFunc: timePicker,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Priority",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                child: Row(
                  children: [
                    UserPriority(
                      color: red,
                      selected: priority == red,
                      onPressed: () => setState(() {
                        priority = red;
                      }),
                    ),
                    UserPriority(
                      color: orange,
                      selected: priority == orange,
                      onPressed: () => setState(() {
                        priority = orange;
                      }),
                    ),
                    UserPriority(
                      color: lightblue,
                      selected: priority == lightblue,
                      onPressed: () => setState(() {
                        priority = lightblue;
                      }),
                    ),
                    UserPriority(
                      color: green,
                      selected: priority == green,
                      onPressed: () => setState(() {
                        priority = green;
                      }),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => addNewTask(context: context),
                child: const Text("ADD")),
          ),
        ],
      ),
    );
  }
}
