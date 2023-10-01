import 'package:flutter/material.dart';

class ListTileDemo extends StatelessWidget {
  const ListTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(
              "ListTile widget Demo",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            const ListTile(
              leading: CircleAvatar(),
              title: Text("This is Heading"),
              subtitle: Text("This is Subtitle \n is next line"),
              trailing: Icon(
                Icons.add,
                size: 24,
                color: Colors.black,
              ),
              isThreeLine: true,
            ),
            ListTile(
              leading: const CircleAvatar(),
              title: const Text("This is Heading"),
              subtitle: const Text("This is Subtitle"),
              trailing: const Icon(
                Icons.add,
                size: 24,
                color: Colors.black,
              ),
              selected: true,
              selectedColor: Colors.green,
              selectedTileColor: Colors.grey,
              onTap: () {},
              enabled: false,
            ),
            const ListTile(
              leading: CircleAvatar(),
              title: Text("This is Heading"),
              subtitle: Text("This is Subtitle"),
              trailing: Icon(
                Icons.add,
                size: 24,
                color: Colors.black,
              ),
              tileColor: Colors.orange,
            ),
          ],
        ));
  }
}
