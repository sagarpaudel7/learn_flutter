import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({super.key});

  @override
  State<CardDemo> createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFA),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "Card Widget Demo",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                    shadowColor: Colors.blue,
                    color: index.isEven ? Colors.deepOrange : const Color(0xFF6A00FF),
                    child: SizedBox(
                      height: 50,
                      width: 800,
                      child: Center(
                        child: Text(
                          "This is $index Card Widget",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            // decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
