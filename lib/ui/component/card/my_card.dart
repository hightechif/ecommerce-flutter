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
        borderRadius: BorderRadius.circular(
          16,
        ), // Adjust the radius as needed
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Image.network(product.imageAsset, fit: boxFit),
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
