import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints for responsive design
    final isDesktop = screenWidth > 600; // Adjust the breakpoint as needed

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "Learn about Responsive",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isDesktop ? 24 : 18, // Adjust font size for mobile
            ),
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "This is responsive",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: isDesktop ? 24 : 18, // Adjust font size for mobile
                    ),
                  ),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 25,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: isDesktop ? 300 : 250, // Adjust for mobile
                    mainAxisSpacing: isDesktop ? 20 : 10, // Adjust for mobile
                    crossAxisSpacing: isDesktop ? 20 : 10, // Adjust for mobile
                    childAspectRatio: isDesktop ? 1 : 1, // Adjust for mobile
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.deepOrange,
                    );
                  },
                ),
                const Divider(
                  thickness: 5,
                  color: Color(0xFF8400FF),
                ),
                Text(
                  "Wow finally make it repsonsive😊😁",
                  style: TextStyle(
                    color: Color(0xFFFF0000),
                    fontWeight: FontWeight.bold,
                    fontSize: isDesktop ? 24 : 18, // Adjust font size for mobile
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
