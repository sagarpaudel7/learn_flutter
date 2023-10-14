import 'package:flutter/material.dart';

class Appbar {
  static AppBar appBar(String text) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blue,
      title: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
