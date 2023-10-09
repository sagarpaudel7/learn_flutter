import 'package:flutter/material.dart';

class Appbar {
  static AppBar appBar(String text) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.deepOrange, fontSize: 24),
        ),
      ),
    );
  }
}
