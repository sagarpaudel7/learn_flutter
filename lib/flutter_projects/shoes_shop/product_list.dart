import 'package:flutter/material.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/global_pro_variable.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/product_container.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/product_detail.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> brand = const [
    "All",
    "Nike",
    "Adidas",
    "Bata",
    "Tiger",
  ];
  late String selectedBrand;
  @override
  void initState() {
    selectedBrand = brand[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                Text("Shoes\n Collection", style: Theme.of(context).textTheme.titleLarge),
                //👉👉using expanded
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: "Search",
                      border: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brand.length,
              itemBuilder: (context, index) {
                final name = brand[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBrand = name;
                      });
                    },
                    child: Chip(
                      label: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: name == selectedBrand ? Theme.of(context).colorScheme.primary : const Color(0xFF848484),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ProductDetail(product: product);
                      }));
                    },
                    child: ProductContainer(
                      title: product['title'] as String,
                      price: product['price'].toString(),
                      imageUrl: product['imageUrl'] as String,
                      bgColor: index.isEven ? const Color.fromARGB(255, 193, 191, 191) : const Color.fromRGBO(216, 240, 249, 1),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
