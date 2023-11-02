import "package:flutter/material.dart";
import "package:learn_flutter/constants.dart/appbar.dart";

class SqfLiteDemo extends StatefulWidget {
  const SqfLiteDemo({super.key});

  @override
  State<SqfLiteDemo> createState() => _SqfLiteDemoState();
}

class _SqfLiteDemoState extends State<SqfLiteDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("SQFLite Demo"),
    );
  }
}
