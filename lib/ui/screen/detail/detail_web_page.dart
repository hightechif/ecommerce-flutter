import 'package:ecommerce_flutter/model/product_item.dart';
import 'package:ecommerce_flutter/utils/numbers_utils.dart';
import 'package:flutter/material.dart';

import '../../component/button/favorite_button.dart';

class DetailWebPage extends StatefulWidget {
  final ProductItem product;
  final TextStyle informationTextStyle;
  final String ticketPrice;

  const DetailWebPage({
    super.key,
    required this.product,
    required this.informationTextStyle,
    required this.ticketPrice,
  });

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
          child: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Product Detail',
                    style: TextStyle(fontFamily: 'Staatliches', fontSize: 32),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(height: 500.0 , child: Image.network(widget.product.imageAsset)),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Biasa dibeli bersamaan",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'Staatliches',
                              ),
                            ),
                            const SizedBox(height: 16),
                            Scrollbar(
                              controller: _scrollController,
                              child: Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ListView(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  children:
                                      widget.product.imageUrls.map((url) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: Image.network(url),
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.product.name,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 24.0,
                                    fontFamily: 'Staatliches',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      widget.product.price.toIDR(),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        fontSize: 28.0,
                                        fontFamily: 'Staatliches',
                                      ),
                                    ),
                                    FavoriteButton(),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: Divider(color: Colors.grey),
                                ),
                                Text(
                                  "Deskripsi Produk",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'Staatliches',
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  child: Text(
                                    widget.product.description,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Oxygen',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
