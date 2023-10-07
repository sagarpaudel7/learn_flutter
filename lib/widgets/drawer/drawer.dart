import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> iconData = [
      {"icon": Icons.send, "heading": "Send"},
      {"icon": Icons.mail, "heading": "Gmail"},
      {"icon": Icons.call, "heading": "Call"},
      {"icon": Icons.video_call, "heading": "Video Call"},
      {"icon": Icons.camera, "heading": "Camera"},
      {"icon": Icons.laptop, "heading": "Laptop"},
      {"icon": Icons.alarm, "heading": "Reminder"},
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/images/others/night.jpg"),
                    ),
                    Text(
                      "Sagar Paudel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "sagarpaudel749@gmail.com",
                      style: TextStyle(
                        color: Color(0xFF00FF22),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: iconData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Icon(
                        iconData[index]["icon"],
                        color: const Color(0xFF0062FF),
                      ),
                      tileColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        //side: BorderSide(style: BorderStyle.solid, color: Colors.black),
                      ),
                      title: Text(
                        iconData[index]["heading"],
                        style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        endDrawer: const Drawer(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/others/night.jpg",
              height: 200,
              width: 250,
            )
          ],
        ),
      ),
    );
  }
}
