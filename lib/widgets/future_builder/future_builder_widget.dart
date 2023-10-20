import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({super.key});

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  Future getName() async {
    await Future.delayed(const Duration(seconds: 3));
    return "Sagar Paudel!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Future Builder Widget"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello👋",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),
            FutureBuilder(
              future: getName(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      Text(
                        snapshot.data,
                        style: const TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              getName();
                            });
                          },
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.green,
                            size: 50,
                          )),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.black,
                            size: 50,
                          ))
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
