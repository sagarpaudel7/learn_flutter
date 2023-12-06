import 'package:flutter/material.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/cart_provider.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/home_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart; //used watch to listen continuous
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: cart.isEmpty
          ? Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/cart/empty_cart.png",
                    width: 300,
                    height: 300,
                  ),
                  const Text(
                    "Oops Products Not Found!!!",
                    style: TextStyle(
                      color: Color(0xFFE3480B),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShoesShop(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart_checkout_rounded,
                      size: 30,
                      color: Colors.blue,
                    ),
                    label: const Text(
                      "Add Products",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                      ),
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.6))),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      cartItem['imageUrl'].toString(),
                    ),
                    radius: 30,
                    backgroundColor: Colors.black,
                  ),
                  title: Text(
                    cartItem['title'].toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    " Size:${cartItem['size'].toString()}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  //👉👉trailing le right side ma widget show garxa.
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "Delete Item",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              content: const Text(
                                "Are you sure to delete item from cart?",
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 20,
                                  //       fontWeight: FontWeight.w400,
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      context.read<CartProvider>().removeProduct(cartItem); //used Read as listen false
                                      //Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "No",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              }),
    );
  }
}
