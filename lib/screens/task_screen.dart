import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/components/one_task.dart';
import 'package:todo_project/model/colors.dart';
import 'package:todo_project/model/task_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final lists = Provider.of<ListTask>(context);
    final now = DateTime.now();
    int completed = 0;

    for (var i = 0; i < lists.taskList.length; i++) {
      lists.taskList[i].userSelectColor == green ? completed++ : completed;
    }

    final dateFormatted = DateFormat('dd MMM, yyyy').format(now);

    return Consumer<ListTask>(builder: (context, list, _) {
      return SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 150,
              child: Container(
                padding: const EdgeInsets.all(15),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Good Morning John",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                fontSize: 30,
                                color: purple,
                              ),
                            ),
                            Text(
                              dateFormatted,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 25),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Completed",
                              style: TextStyle(color: green, fontSize: 18),
                            ),
                            Text(
                                "${completed.toString()}/${lists.taskList.length}")
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                controller: controller,
                itemCount: lists.taskList.length,
                itemBuilder: (context, index) =>
                    Task(task: lists.taskList[index]))
          ],
        ),
      );
    });
  }
}
