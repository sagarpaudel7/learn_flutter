import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_flutter/learn_provider/counter_app/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  void initState() {
    super.initState();
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);

    Timer.periodic(const Duration(seconds: 2), (timer) {
      counterProvider.newCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("Full Widget called");
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 25, 4),
      appBar: AppBar(
        title: const Text("Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Consumer<CounterProvider>(builder: ((context, value, child) {
            print("the value is: $value ");
            // ignore: avoid_print
            print("Text Widget called");
            return Text(
              "Counter number is: ${value.count} ",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
            );
          })))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.newCount();
          // ignore: avoid_print
          print("floating button Widget called");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
