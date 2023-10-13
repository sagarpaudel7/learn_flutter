import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isOn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Switch")),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              isOn ? "assets/images/switch_img/on.png" : "assets/images/switch_img/off.png",
              height: MediaQuery.of(context).size.height * 0.50,
            ),
            const Spacer(),
            //for adaptive switch
            text("Adaptive"),

            Transform.scale(
              scale: 1.5,
              child: Switch.adaptive(
                  //this is uded for both active and inactive status and need belows code comment
                  // thumbColor: MaterialStateProperty.all<Color>(Colors.green),
                  //trackColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
//for above sa

                  activeColor: Colors.deepOrange,
                  activeTrackColor: Colors.blueAccent,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.black87,
                  splashRadius: 40,
                  value: isOn,
                  onChanged: (value) {
                    setState(() => isOn = value);
                  }),
            ),
            const Spacer(),
            //for IOS switch
            text("IOS"),
            Transform.scale(
                scale: 1.2,
                child: CupertinoSwitch(
                  value: isOn,
                  onChanged: ((value) {
                    setState(() => isOn = value);
                  }),
                )),
            const Spacer(),
            //for Android switch
            text("Android"),
            Transform.scale(
              scale: 1.5,
              child: Switch(
                  value: isOn,
                  onChanged: (value) {
                    setState(() => isOn = value);
                  }),
            ),
            const Spacer(),
            //for Image switch
            text("Switch Image"),
            Transform.scale(
              scale: 2,
              child: Switch(
                  activeThumbImage: const AssetImage("assets/images/switch_img/sun.png"),
                  inactiveThumbImage: const AssetImage("assets/images/switch_img/moon.png"),
                  value: isOn,
                  onChanged: (value) {
                    setState(() => isOn = value);
                  }),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget text(String text) => Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
      );
}
