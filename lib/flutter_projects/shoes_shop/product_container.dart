import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final Color bgColor;
  const ProductContainer({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: bgColor,
      ),
      //👉👉yeti boxdecoration use garyo vane color property tyo vitra lekhnu parxa
      //otherwase bahira lekhda hunxa.
      //color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Rs. $price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
