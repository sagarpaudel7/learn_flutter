import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ElevatedBtn({required this.text, required this.onClicked, super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          overlayColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 22, 202, 154)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFFfcfcff),
          ),
        ),
      );
}
