import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  List<String> allItems = [
    "Select Item",
    "Apple",
    "Ball",
    "Cat",
    "Dog",
    "Elephant",
    "Fish",
    "Goat",
    "Hen",
    "Ink",
    "Lion",
    "Mango",
    "Nose",
    "Orange",
    "Pen",
    "Queen",
    "Rose",
    "Stone",
    "Table",
    "Umbrella",
    "Vertical",
    "Watch",
    "X-ray",
    "Zebra",
  ];
  String selectedItem = "Select Item";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("DropDown Demo"),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 2,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton(
              elevation: 0,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.red,
              ),
              menuMaxHeight: 400,
              dropdownColor: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
              value: selectedItem,
              items: allItems
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(color: selectedItem == e ? Colors.deepOrange : Colors.black),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedItem = value as String;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
