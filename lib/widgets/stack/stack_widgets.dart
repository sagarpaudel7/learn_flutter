import 'package:flutter/material.dart';

class StackWidgets extends StatelessWidget {
  const StackWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(
              "Stack With its Property",
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    //for direction of text and children
                    textDirection: TextDirection.ltr,

                    // for change the stack children property
                    fit: StackFit.loose,

                    //allignment setup of stack childrens
                    alignment: AlignmentDirectional.center,

                    //for set the extra part of children to clip or not
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        color: Colors.orange,
                      ),
                      Positioned(
                        bottom: -100,
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.green,
                        ),
                      ),
                      const Text(
                        "This is stack Widget",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //=========In stack positioned property use for positioned the specific children
                      Positioned(
                        //height: 300,
                        //width: 300,
                        top: -120,
                        child: Container(
                          height: 250,
                          width: 250,
                          color: const Color(0xFFFF0101),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Proper use of Stack",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                height: 350,
                width: 350,
                child: Stack(
                  children: [
                    Center(child: Image.asset("assets/images/shoes1.jpg")),
                    Positioned(
                      //left 10 pixel to start the position
                      left: 10,
                      right: 10,
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: index.isEven
                                    ? const Icon(
                                        Icons.star,
                                        color: Color(0xFFFF3C00),
                                        size: 40,
                                      )
                                    : const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                              );
                            })),
                      ),
                    ),
                    const Positioned(
                      top: 100,
                      left: 20,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                    const Positioned(
                      top: 100,
                      left: 200,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.orange,
                      ),
                    ),
                    const Positioned(
                      top: 240,
                      left: 150,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
