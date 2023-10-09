import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class GlassMorphismDemo extends StatefulWidget {
  const GlassMorphismDemo({super.key});

  @override
  State<GlassMorphismDemo> createState() => _GlassMorphismDemoState();
}

class _GlassMorphismDemoState extends State<GlassMorphismDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: Appbar.appBar("Glassmorphism"),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/others/bubble.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            scale: 1,
          ),
          SafeArea(
            child: Column(
              children: [
//==================== Glassmorphism with Package ======================
                Center(
                  child: GlassmorphicContainer(
                    width: 250,
                    height: 350,
                    borderRadius: 20,
                    blur: 10,
                    alignment: Alignment.bottomCenter,
                    border: 4,
                    linearGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                      const Color(0xFFffffff).withOpacity(0.1),
                      const Color(0xFFFFFFFF).withOpacity(0.05),
                    ], stops: const [
                      0.1,
                      1,
                    ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFfcfcff).withOpacity(0.5),
                        const Color((0xFFfcfcff)).withOpacity(0.5),
                      ],
                    ),
                    child: Column(
                      children: const [
                        Text(
                          "Data",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          "Data",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
