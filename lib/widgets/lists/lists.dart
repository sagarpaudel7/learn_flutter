import 'package:flutter/material.dart';

class ListExamples extends StatefulWidget {
  const ListExamples({super.key});

  @override
  State<ListExamples> createState() => _ListExamplesState();
}

class _ListExamplesState extends State<ListExamples> {
  var arrDesc = [
    "This is ListView.Builder.",
    "Used for Dynamic data Present.",
    "Property are same as ListView widget.",
  ];
  var arrSep = [
    "This is ListView.seperated.",
    "Used for Dynamic data Present.",
    "Property are same as ListView widget.",
    "used separatorBuilder for seperate widget.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "Defferent List Examples",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "The ListView widget is used for static data present.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
//====================ListView=======================
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.vertical,
                itemExtent: 40,
                //reverse: true,
                children: const [
                  Text(
                    "Hello My name is Sagar.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "This is ListView Widget.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Used for static content.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Used reverse proprty for reverse content.",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "The ListView.Builder widget is used for dynamic data present.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
//====================ListView.Builder=======================
            SizedBox(
              height: 120,
              child: ListView.builder(
                  itemExtent: 40,
                  itemCount: arrDesc.length,
                  itemBuilder: (context, index) {
                    return Text(
                      arrDesc[index],
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "The ListView.Seperated widget is used for dynamic data with Divider or repeated widget.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
//====================ListView.seperated=======================
            SizedBox(
              height: 150,
              child: ListView.separated(
                itemCount: arrSep.length,
                itemBuilder: (context, index) {
                  return Text(
                    arrSep[index],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 3,
                    color: Colors.orange,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
