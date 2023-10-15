import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({super.key});

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  List<String> province = ["Koshi", "Madhesh", "Bagmati", "Gandaki", "Lumbini", "Karnali", "Sudurpashchim"];
  List<String> districtLumbini = [
    "Parasi",
    "Dang",
    "Gulmi",
    "Kapilvastu",
    "Arghakharchi",
    "Palpa",
    "Rukum East",
    "Pyuthan",
    "Banke",
    "Bardiya",
    "Rupandehi",
    "Rolpa",
  ];
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Expansion Tile Widget"),
      body: SingleChildScrollView(
        child: Column(
          children: [
//===========learn property of Expansion Tile =====================
            ExpansionTile(
              title: const Text("data"),
              leading: const Icon(Icons.ring_volume),
              // initiallyExpanded: true, //auto expand in start
              collapsedBackgroundColor: Colors.grey,
              backgroundColor: Colors.white,
              collapsedIconColor: Colors.black,
              //for custom icon in triling
              trailing: isVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
              onExpansionChanged: ((value) {
                setState(() {
                  isVisible = value;
                });
              }),
              ///////////////////////
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: Text(
                      "Data",
                      style: TextStyle(
                        color: index.isEven ? Colors.deepOrange : Colors.deepPurple,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ));
                  },
                ),
              ],
            ),
//let's design something different haha 😅
            const Divider(
              color: Colors.deepOrange,
              thickness: 3,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: province.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ExpansionTile(
                    backgroundColor: Colors.grey.withOpacity(0.30),
                    title: Text(
                      province[index],
                    ),
                    children: [
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                            itemCount: districtLumbini.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  districtLumbini[index],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
