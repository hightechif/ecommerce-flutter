import 'package:ecommerce_flutter/model/product_item.dart';
import 'package:ecommerce_flutter/utils/numbers_utils.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final ProductItem product;
  final BoxFit boxFit;

  const MyCard({super.key, required this.product, required this.boxFit});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Adjust the radius as needed
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.grey[100], // Background color for empty space
            constraints: BoxConstraints(
              minHeight: 100, // Set minimum height
              maxHeight: 150, // Set maximum height
            ),
            width: double.infinity,
            child: Image.network(
              product.imageAsset,
              fit: boxFit,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) =>
                  Container(
                    color: Colors.grey[100], // Matches your card's background
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 40, // Optimal size for visibility
                        color: Colors.grey[400], // Subtle but visible
                      ),
                    ),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(product.name, style: const TextStyle(fontSize: 16.0)),
                const SizedBox(height: 10),
                Text(product.price.toIDR()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
