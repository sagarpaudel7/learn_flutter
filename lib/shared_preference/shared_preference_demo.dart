import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDemo extends StatefulWidget {
  const SharedPreferenceDemo({super.key});

  @override
  State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
}

class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // ignore: constant_identifier_names
  static const String KEYNAME = "name";
  // ignore: constant_identifier_names
  static const String KEYPASSWORD = "password";

  var nameValue = "...";
  var passwordValue = "...";

  @override
  void initState() {
    super.initState();
    getData();
  }

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
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setString(KEYNAME, nameController.text.toString());
                  sharedPreferences.setString(KEYPASSWORD, passwordController.text.toString());
                },
                child: const Text("Save")),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Hello $nameValue, your password is \"$passwordValue\"",
              style: const TextStyle(
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

  getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var getName = sp.getString(KEYNAME);
    var getPassword = sp.getString(KEYPASSWORD);
    setState(() {
      nameValue = getName != null ? getName : "...";
      passwordValue = getPassword != null ? getPassword : "...";
    });
  }
}
