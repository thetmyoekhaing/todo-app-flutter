import 'package:flutter/material.dart';

class UserPriority extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onPressed;

  const UserPriority(
      {super.key,
      required this.color,
      required this.selected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
