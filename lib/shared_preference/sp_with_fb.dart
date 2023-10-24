import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWithFutureBuilder extends StatefulWidget {
  const SharedPreferencesWithFutureBuilder({super.key});

  @override
  State<SharedPreferencesWithFutureBuilder> createState() => _SharedPreferencesWithFutureBuilderState();
}

class _SharedPreferencesWithFutureBuilderState extends State<SharedPreferencesWithFutureBuilder> {
  //for textfield controller
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //for checkBox
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("SP with FB"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//=============== for name ==============
            TextField(
              controller: nameController,
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
              controller: passwordController,
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
            Row(
              children: [
                Checkbox(
                    value: isSaved,
                    onChanged: (value) {
                      setState(() {
                        isSaved = value!;
                      });
                    }),
                const Text(
                  "Do you want to save data?",
                  style: TextStyle(color: Color(0xFF004CFF), fontSize: 17, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (isSaved == true) {
                    SharedPreferences sp = await SharedPreferences.getInstance();
                    sp.setString("name", nameController.text.toString());
                    sp.setString("password", passwordController.text.toString());
                    nameController.clear();
                    passwordController.clear();
                    //for snackbar with futureBuilder
                    final snackMessage = SnackBar(
                      backgroundColor: Colors.blueAccent,
                      duration: const Duration(seconds: 3),
                      content: FutureBuilder(
                          future: SharedPreferences.getInstance(),
                          builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
                            return Text(
                              "Hello ${snapshot.data!.getString("name").toString()}, your password is \"${snapshot.data!.getString("password").toString()}\"",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          }),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackMessage);
                  } else {
                    final emplySnackMsz = SnackBar(
                        backgroundColor: Colors.grey[300],
                        content: const Text(
                          "You don't save data!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ));
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(emplySnackMsz);
                  }
                },
                child: const Text("Save")),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
