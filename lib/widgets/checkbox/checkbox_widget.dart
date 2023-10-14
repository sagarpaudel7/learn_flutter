import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool? isBca = false;
  bool? isCsit = false;
  bool? isBim = false;
  //for checkbox we need to use ? for null value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Checkbox Widget"),
      body: Center(
        child: Column(
          children: [
            Transform.scale(
              scale: 2,
              child: Checkbox(
                  //tristate allows the null value the in null - sign appear
                  //tristate: true,
                  activeColor: Colors.deepOrange,
                  checkColor: Colors.deepPurple,
                  // shape: const CircleBorder(),
                  splashRadius: 10,
                  value: isBca,
                  onChanged: (value) {
                    setState(() {
                      isBca = value;
                    });
                  }),
            ),
            Transform.scale(
              scale: 2,
              child: Checkbox(
                  //tristate allows the null value the in null - sign appear
                  // tristate: true,
                  activeColor: Colors.deepOrange,
                  checkColor: Colors.deepPurple,
                  // shape: const CircleBorder(),
                  splashRadius: 10,
                  value: isCsit,
                  onChanged: (value) {
                    setState(() {
                      isCsit = value;
                    });
                  }),
            ),
            Transform.scale(
              scale: 2,
              child: Checkbox(
                  //tristate allows the null value the in null - sign appear
                  //tristate: true,
                  activeColor: Colors.deepOrange,
                  checkColor: Colors.deepPurple,
                  // shape: const CircleBorder(),
                  splashRadius: 0,
                  value: isBim,
                  onChanged: (value) {
                    setState(() {
                      isBim = value;
                    });
                  }),
            ),
            CheckboxListTile(
              value: isBca,
              onChanged: (value) {
                setState(() {
                  isBca = value;
                });
              },
              title: const Text("Listtile Checkbox"),
            ),
            CheckboxListTile(
              value: isCsit,
              onChanged: (value) {
                setState(() {
                  isCsit = value;
                });
              },
              title: const Text("Listtile Checkbox"),
              //for leading checkbox
              controlAffinity: ListTileControlAffinity.leading,
            )
          ],
        ),
      ),
    );
  }
}
