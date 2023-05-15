import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_project/screens/task_add_screen.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.menu),
            ),
            Text("ThingsTODO"),
          ],
        ),
        SizedBox(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  Icons.notifications_active,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return TaskAddScreen();
                    },
                  ));
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
