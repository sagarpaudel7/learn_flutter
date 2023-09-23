import 'package:flutter/material.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/global_pro_variable.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
        centerTitle: true,
      ),
      body: ListView.builder(
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
              trailing: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            );
          }),
    );
  }
}
