import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_project/model/task_model.dart';
import 'package:todo_project/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListTask(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        title: "ThingsTODO",
        home: const Home(),
      ),
    );
  }
}
