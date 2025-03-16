import 'package:ecommerce_flutter/model/product_item.dart';
import 'package:flutter/material.dart';

import '../../component/favorite_button.dart';

class DetailMobilePage extends StatelessWidget {
  final ProductItem product;
  final TextStyle informationTextStyle;
  final String ticketPrice;

  const DetailMobilePage({
    super.key,
    required this.product,
    required this.informationTextStyle,
    required this.ticketPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 36.0),
                    child: Image.network(product.imageAsset),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          const FavoriteButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  product.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Staatliches',
                  ),
                ),
              ),
              Text(
                product.price,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 22.0, fontFamily: 'Oxygen'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(color: Colors.grey),
              ),
              Text(
                "Deskripsi Produk",
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 22.0, fontFamily: 'Oxygen'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(color: Colors.grey),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Biasa dibeli bersamaan",
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 22.0, fontFamily: 'Oxygen'),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final String imageUrl = product.imageUrls[index];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(imageUrl),
                      ),
                    );
                  },
                  itemCount: product.imageUrls.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
