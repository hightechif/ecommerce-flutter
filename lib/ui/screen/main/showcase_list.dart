import 'package:ecommerce_flutter/model/product_item.dart';
import 'package:ecommerce_flutter/ui/screen/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class ShowcaseList extends StatelessWidget {
  const ShowcaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 250.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final ProductItem product = productList[index];
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
              child: SizedBox(
                width: 175.0,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(product.imageAsset),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              product.name,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 10),
                            Text(product.price),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: productList.length,
        ),
      ),
    );
  }
}
