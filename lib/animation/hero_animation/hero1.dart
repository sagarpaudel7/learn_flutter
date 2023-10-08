import 'package:flutter/material.dart';
import 'package:learn_flutter/animation/hero2.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';
import 'package:learn_flutter/constants.dart/heading_text.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Hero Animation"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const Hero2())));
            },
            child: Hero(
              tag: "Hero",
              child: Image.asset(
                "assets/images/others/night.jpg",
                height: 150,
                width: 400,
              ),
            ),
          ),
          HeadingText.headingTetx("\n\nClick Image for Hero Animation")
        ],
      ),
    );
  }
}
