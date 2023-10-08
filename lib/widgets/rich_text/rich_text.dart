import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar.appBar("Rich Text Demo"),
        body: Center(
          child: RichText(
            text: const TextSpan(
                text: "Hello, ",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold), //it is parent and if  children not used style parent style applyed
                children: [
                  TextSpan(text: "world! ", style: TextStyle(color: Colors.deepOrange, fontSize: 20)),
                  TextSpan(text: "Detault Size", style: TextStyle(color: Colors.purpleAccent)),
                ]),
          ),
        ));
  }
}
