import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class Hero2 extends StatelessWidget {
  const Hero2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Hero Animation 2"),
      body: Hero(
        tag: "Hero",
        child: Image.asset("assets/images/others/cso.jpg"),
      ),
    );
  }
}
