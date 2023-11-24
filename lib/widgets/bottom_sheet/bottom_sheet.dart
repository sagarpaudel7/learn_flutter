import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class ShowModalBottomSheetDemo extends StatelessWidget {
  const ShowModalBottomSheetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Show ModalBottomSheet"),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                useSafeArea: true,
                backgroundColor: Colors.limeAccent,
                context: context,
                builder: (BuildContext context) {
                  return const SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text("Data"),
                          SizedBox(
                            height: 25,
                          ),
                          Text("Data"),
                        ],
                      ));
                });
          },
          child: const Text("Click Me"),
        ),
      ),
    );
  }
}
