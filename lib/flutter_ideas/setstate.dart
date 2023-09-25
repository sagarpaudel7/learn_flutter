import 'dart:async';

import 'package:flutter/material.dart';

class SetstateDemo extends StatefulWidget {
  const SetstateDemo({super.key});

  @override
  State<SetstateDemo> createState() => _SetstateDemoState();
}

class _SetstateDemoState extends State<SetstateDemo> {
  int num = 0;

  @override
  void initState() {
    super.initState();
    //after 1 second initialize the num and rebuild the application
    Timer.periodic(const Duration(seconds: 1), (timer) {
      num++;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Counter")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "You pressed the button $num  times.",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Current TIme is: ${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second} ",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            num++;
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
