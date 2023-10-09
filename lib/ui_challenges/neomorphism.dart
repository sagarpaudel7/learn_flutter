import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:learn_flutter/constants.dart/appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeomorphismDemo extends StatefulWidget {
  const NeomorphismDemo({super.key});

  @override
  State<NeomorphismDemo> createState() => _NeomorphismDemoState();
}

class _NeomorphismDemoState extends State<NeomorphismDemo> {
  bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: Appbar.appBar("Neomorphism"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: [
//================ Custom Neomorphism Design ================
            Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isElevated = !_isElevated;
                  });
                },
                borderRadius: BorderRadius.circular(40),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 50),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: _isElevated
                          ? [
                              const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-8, -8),
                                spreadRadius: 1,
                                blurStyle: BlurStyle.inner,
                                inset: true,
                              ),
                              const BoxShadow(
                                color: Colors.grey,
                                offset: Offset(8, 8),
                                spreadRadius: 1,
                                blurStyle: BlurStyle.inner,
                                inset: true,
                              ),
                            ]
                          : [
                              const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-8, -8),
                                spreadRadius: 1,
                                blurRadius: 15,
                                blurStyle: BlurStyle.outer,
                              ),
                              const BoxShadow(
                                color: Colors.grey,
                                offset: Offset(8, 8),
                                spreadRadius: 1,
                                blurRadius: 15,
                                blurStyle: BlurStyle.outer,
                              ),
                            ]),
                  child: _isElevated
                      ? const Icon(
                          FontAwesomeIcons.heartPulse,
                          color: Colors.red,
                          size: 100,
                        )
                      : const Icon(
                          FontAwesomeIcons.heartCrack,
                          color: Colors.black,
                          size: 100,
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
