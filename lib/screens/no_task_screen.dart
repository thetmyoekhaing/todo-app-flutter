import 'package:flutter/material.dart';

class NoTaskScreen extends StatelessWidget {
  const NoTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
              width: 150,
              height: 150,
              image: NetworkImage(
                  "https://cdn.discordapp.com/attachments/1085505188208574555/1085506949858201640/Group_141.png")),
          Text("All done for now",
              style: TextStyle(
                  color: Color(0xff7646FF),
                  fontSize: 25,
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
