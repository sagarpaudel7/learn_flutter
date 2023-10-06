import 'package:flutter/material.dart';

class UiChallenge extends StatelessWidget {
  const UiChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    var safePadding = MediaQuery.of(context).padding.top;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          title: const Center(
            child: Text(
              "Try to UI design",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                border: Border(bottom: BorderSide(color: Color.fromARGB(255, 243, 117, 33), width: 0)),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: const BoxDecoration(
                  color: Color(0xFF6E0808),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                height: (MediaQuery.of(context).size.height - 56 - safePadding) * 0.4,
              ),
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      height: (MediaQuery.of(context).size.height - 56 - safePadding) * 0.6,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF6E0808),
                        border: Border(top: BorderSide(color: Color(0xFF6E0808), width: 0)),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                          ),
                        ),
                        height: (MediaQuery.of(context).size.height - 56 - safePadding) * 0.6,
                      ),
                    ),
                  ],
                ),
                Positioned(
                    child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height - 56 - safePadding) * 0.6,
                    child: const Text('This is a UI Challenge',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
