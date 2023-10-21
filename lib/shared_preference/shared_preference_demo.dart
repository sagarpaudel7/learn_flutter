import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class SharedPreferenceDemo extends StatefulWidget {
  const SharedPreferenceDemo({super.key});

  @override
  State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
}

class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: Appbar.appBar("Shared Preference Demo"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//=============== for name ==============
            TextField(
              controller: name,
              decoration: InputDecoration(
                label: const Text("Name"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.deepOrange, width: 2), // Set the normal outline color to orange
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.blue, width: 2), // Set the focused (active) outline color to orange
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
//================ for password ==============
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                label: const Text("Password"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.deepOrange, width: 2), // Set the normal outline color to orange
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.blue, width: 2), // Set the focused (active) outline color to orange
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Save")),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Hello ... your password is ...",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
