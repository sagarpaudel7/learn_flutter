import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "GridView Demo",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                "GridView Count Demo",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.53,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  Container(color: Colors.yellow),
                  Container(color: Colors.red),
                  Container(color: Colors.black),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.deepOrange),
                  Container(color: Colors.blue),
                ],
              ),
            ),
            const Divider(
              thickness: 5,
              color: Colors.deepOrange,
            ),
            const Text(
              "GridView extent Demo",
              style: TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.extent(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                maxCrossAxisExtent: 300,
                children: [
                  Container(color: Colors.yellow),
                  Container(color: Colors.red),
                  Container(color: Colors.black),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.deepOrange),
                  Container(color: Colors.blue),
                ],
              ),
            ),
            const Divider(
              thickness: 5,
              color: Colors.pink,
            ),
            const Text(
              "GridView builder Demo",
              style: TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.brown,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
