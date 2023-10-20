import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class NavigatePage extends StatelessWidget {
  const NavigatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Finally you're here..."),
      body: const Center(
        child: Text("😆It's my dressing room go back!🙈"),
      ),
    );
  }
}
