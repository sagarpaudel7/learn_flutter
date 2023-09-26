import 'package:flutter/material.dart';
import 'package:learn_flutter/learn_provider/opacity_changer_app/provider/opacity_provider.dart';
import 'package:provider/provider.dart';

class OpacitySlider extends StatefulWidget {
  const OpacitySlider({super.key});

  @override
  State<OpacitySlider> createState() => _OpacitySliderState();
}

class _OpacitySliderState extends State<OpacitySlider> {
  @override
  Widget build(BuildContext context) {
    // final sliderValue = Provider.of<OpacityProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add to Favourite"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<OpacityProvider>(builder: (context, value, child) {
            return Slider(
              min: 0,
              max: 1,
              value: value.val,
              onChanged: (newval) {
                value.newValue(newval);
                //  val = newval;
              },
            );
          }),
          Consumer<OpacityProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(value.val),
                    ),
                    child: const Center(
                      child: Text(
                        "Container 1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF009105).withOpacity(value.val),
                    ),
                    child: const Center(
                      child: Text(
                        "Container 2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
