import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({super.key});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

List<String> option = ["option1", "option2", "option3", "option4"];

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  String currentvalue = option[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Radio Button"),
      body: Column(
        children: [
          ListTile(
            leading: Transform.scale(
              scale: 2,
              child: Radio(
                  // activeColor: Colors.deepOrange, //doesnot work any
                  splashRadius: 50,
                  fillColor: MaterialStateProperty.all<Color>(Colors.red),
                  value: option[0],
                  groupValue: currentvalue,
                  onChanged: (value) {
                    setState(() {
                      currentvalue = value.toString();
                    });
                  }),
            ),
            title: Text(option[0]),
          ),
          ListTile(
            leading: Radio(
                value: option[1],
                groupValue: currentvalue,
                onChanged: (value) {
                  setState(() {
                    currentvalue = value.toString();
                  });
                }),
            title: Text(option[1]),
          ),
          ListTile(
            leading: Radio(
                value: option[2],
                groupValue: currentvalue,
                onChanged: (value) {
                  setState(() {
                    currentvalue = value.toString();
                  });
                }),
            title: Text(option[2]),
          ),
          ListTile(
            leading: Radio(
                value: option[3],
                groupValue: currentvalue,
                onChanged: (value) {
                  setState(() {
                    currentvalue = value.toString();
                  });
                }),
            title: Text(option[3]),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          RadioListTile(
            value: option[0],
            groupValue: currentvalue,
            onChanged: (value) {
              setState(() {
                currentvalue = value.toString();
              });
            },
            title: const Text("data1"),
            subtitle: const Text("data1"),
          ),
          RadioListTile(
            value: option[1],
            groupValue: currentvalue,
            onChanged: (value) {
              setState(() {
                currentvalue = value.toString();
              });
            },
            title: const Text("data2"),
            subtitle: const Text("data2"),
          )
        ],
      ),
    );
  }
}
