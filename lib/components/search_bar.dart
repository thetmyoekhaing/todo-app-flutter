import 'package:flutter/material.dart';
import 'package:todo_project/model/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
      color: purple,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Container(
          padding: const EdgeInsets.only(left: 15),
          child: TextField(
              decoration: InputDecoration(
            hintText: "Search Task",
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          )),
        ),
      ),
    );
  }
}
