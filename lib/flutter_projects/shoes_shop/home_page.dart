import 'package:flutter/material.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/cart_page.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/cart_provider.dart';

import 'package:learn_flutter/flutter_projects/shoes_shop/product_list.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class ShoesShop extends StatefulWidget {
  const ShoesShop({super.key});

  @override
  State<ShoesShop> createState() => _ShoesShopState();
}

class _ShoesShopState extends State<ShoesShop> {
  int currentPage = 0;
  List<Widget> pages = [
    const ProductList(),
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    int itemCount = context.watch<CartProvider>().cart.length;

    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),

      // pages[currentPage],
      //👉👉indexedstack use gare paxi pahila jun condition ma page xodeko ho feri return huda same hunxa.
      //rw children ma pages rakheko pages list of widget vayerw ho
      //ani index le pages ko index 1,2 check garxa kun ma jane

      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          //👉👉mathi 0,0 rakheko bottomnavigaton bar le label magxa ani empty rakhda pani some space
          //line vayeko le 0,0 set gareko ani space remove hunxa.
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: badges.Badge(
                  showBadge: itemCount > 0 ? true : false,
                  position: badges.BadgePosition.topEnd(end: -12, top: -12),
                  badgeStyle: const badges.BadgeStyle(badgeColor: Color(0xFF7921F3)),
                  badgeAnimation: const badges.BadgeAnimation.scale(
                    animationDuration: Duration(seconds: 1),
                  ),
                  badgeContent: Text(
                    itemCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Icon(Icons.shopping_cart),
                ),
                label: ""),
          ]),
    );
  }
}
