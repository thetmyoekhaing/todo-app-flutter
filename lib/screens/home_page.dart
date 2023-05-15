import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_project/components/app_bar.dart';

import 'package:todo_project/components/search_bar.dart';
import 'package:todo_project/model/colors.dart';
import 'package:todo_project/model/task_model.dart';
import 'package:todo_project/screens/no_task_screen.dart';
import 'package:todo_project/screens/task_add_screen.dart';
import 'package:todo_project/screens/task_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final lists = Provider.of<ListTask>(context);
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: purple, title: MyAppBar()),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SearchBar(),
          lists.taskList.isEmpty
              ? const NoTaskScreen()
              : const SingleChildScrollView(
                  child: TaskScreen(),
                ),
        ],
      ),
    );
  }
}
