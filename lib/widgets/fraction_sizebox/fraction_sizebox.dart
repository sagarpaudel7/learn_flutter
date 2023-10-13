import 'package:flutter/material.dart';

class FractionSizeboxWidget extends StatelessWidget {
  const FractionSizeboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.deepOrange,
          ),
          //when use fraction sizebox in row or column we need to wrap with expanded or flexiable
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.2, //it's 20% of space
            ),
          ),
          Container(
            height: 200,
            color: Colors.deepOrange,
          ),
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.2, //it's 20% of space
            ),
          ),
          Container(
            height: 200,
            width: 300,
            color: Colors.deepOrange,
            child: FractionallySizedBox(widthFactor: 0.50, heightFactor: 0.30, child: ElevatedButton(onPressed: () {}, child: const Icon(Icons.add))),
          )
        ],
      ),
    );
  }
}
