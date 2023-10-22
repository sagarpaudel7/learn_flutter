import 'package:flutter/material.dart';

class ColumnIdeas extends StatelessWidget {
  const ColumnIdeas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: ColoredBox(
        color: Color(0xFFff5f1f),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center, 👉it doesn't work cos column take only required size of widgets so no other space available.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter Column Property",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
