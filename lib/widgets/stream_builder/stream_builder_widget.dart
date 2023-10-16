import 'dart:async';

import "package:flutter/material.dart";
import 'package:learn_flutter/constants.dart/appbar.dart';

class StreamBuilderWidget extends StatefulWidget {
  const StreamBuilderWidget({super.key});

  @override
  State<StreamBuilderWidget> createState() => _StreamBuilderWidgetState();
}

class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {
  Stream getTime() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));

      yield DateTime.now();
    }
  }

  StreamController<String> typeText = StreamController<String>();
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    typeText.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Stream Builder Widget"),
      body: Center(
        child: Column(
          children: [
            StreamBuilder(
                stream: getTime(),
                builder: ((context, snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: const TextStyle(
                      color: Color(0xFF1900FF),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                })),
            const Divider(
              color: Colors.deepOrange,
              thickness: 3,
            ),
            StreamBuilder<String>(
              stream: typeText.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: const TextStyle(
                      color: Color(0xFFD900FF),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                } else {
                  return const Text(
                    "Type to Show here...",
                    style: TextStyle(
                      color: Color(0xFFD900FF),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }
              },
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: textEditingController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  typeText.add(textEditingController.text);
                },
                child: const Text("OK"))
          ],
        ),
      ),
    );
  }
}
