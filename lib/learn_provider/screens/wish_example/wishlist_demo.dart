import 'package:flutter/material.dart';
import 'package:learn_flutter/learn_provider/provider/wishlist_provider.dart';
import 'package:learn_flutter/learn_provider/screens/wish_example/wishItem.dart';
import 'package:provider/provider.dart';

class WishlistDemo extends StatefulWidget {
  const WishlistDemo({super.key});

  @override
  State<WishlistDemo> createState() => _WishlistDemoState();
}

class _WishlistDemoState extends State<WishlistDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Wishlist",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const WishItem())));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            "Total Item List",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 25,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProder>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text("First Item ${index + 1}"),
                        trailing: value.selectedItem.contains(index)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
