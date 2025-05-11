import 'package:ecommerce_flutter/model/product_item.dart';
import 'package:ecommerce_flutter/ui/screen/detail/detail_screen.dart';
import 'package:ecommerce_flutter/utils/numbers_utils.dart';
import 'package:flutter/material.dart';

class ShowcaseGrid extends StatelessWidget {
  final int gridCount;

  const ShowcaseGrid({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: _generateContainers(context),
      ),
    );
  }

  List<Widget> _generateContainers(BuildContext context) {
    return productList.map((product) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailScreen(product: product);
              },
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ), // Adjust the radius as needed
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(product.imageAsset, fit: BoxFit.fill),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(product.price.toIDR()),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
