import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final bool _validate = false;

  TimeOfDay? timeOfDay = TimeOfDay.now();
  final String placeholder;
  TextEditingController controller = TextEditingController();
  void Function()? onTapFunc;
  Input(
      {super.key,
      required this.controller,
      this.onTapFunc,
      required this.placeholder,
      this.timeOfDay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (value) {
              value.isEmpty || value == ""
                  ? _validate == true
                  : _validate == false;
            },
            controller: controller,
            onTap: onTapFunc ?? () {},
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
                errorText:
                    _validate ? "$placeholder is a required field" : null),
          ),
        ),
      ),
    );
  }
}
