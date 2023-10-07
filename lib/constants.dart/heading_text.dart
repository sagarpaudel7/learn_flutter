import 'package:flutter/material.dart';

class HeadingText {
  static Text headingTetx(String heading) {
    return Text(
      heading,
      style: const TextStyle(color: Colors.deepOrange, fontSize: 24),
    );
  }
}
