import 'package:flutter/material.dart';

class SliverAppbarDemo extends StatelessWidget {
  const SliverAppbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), //for stretch mode it need to implement
        slivers: [
          //========for Appbar =================
          SliverAppBar(
            //   toolbarHeight: 100,
            floating: true, //instant apper appbar when scrolldown
            pinned: true, //pinned the appbar when scrollup
            snap: true, //small scroll to auto appeaar or disappear appbar it need floating
            stretch: true, //for stretch mode it need to true
            leading: const Icon(Icons.arrow_back_ios),
            title: const Text("Sliver Appbar", style: TextStyle(color: Colors.blue, fontSize: 24)),
            actions: const [Icon(Icons.settings), Icon(Icons.video_call)],
            backgroundColor: const Color(0xFF2A261B),
            expandedHeight: 200,
            //========== for flexiable Appbar =================
            flexibleSpace: FlexibleSpaceBar(
              //collapseMode: CollapseMode.pin, //the image will pinned in fixed position
              collapseMode: CollapseMode.parallax, //move the background
              //   title: Text("This is flexiable title"),
              stretchModes: const [
                //for implement its feature need strech:true, and physics
                StretchMode.blurBackground, //blur the background
                StretchMode.fadeTitle, //disappear the title
                StretchMode.zoomBackground, //zoom the background
              ],
              background: Image.asset(
                "assets/images/others/night.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          //===========it used to as a body to use normal widget in sliver ===============
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(25)),
                        ),
                      );
                    },
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.deepOrange,
                        height: 100,
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
