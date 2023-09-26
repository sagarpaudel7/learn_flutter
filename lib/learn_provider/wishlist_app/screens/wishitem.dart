import 'package:flutter/material.dart';
import 'package:learn_flutter/learn_provider/wishlist_app/provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishItem extends StatefulWidget {
  const WishItem({super.key});

  @override
  State<WishItem> createState() => _WishItemState();
}

class _WishItemState extends State<WishItem> {
  @override
  Widget build(BuildContext context) {
    final myitems = Provider.of<FavoriteProder>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "My Favourite Items",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Favourite Item List",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: myitems.selectedItem.length,
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
