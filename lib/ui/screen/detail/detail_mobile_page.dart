import 'package:ecommerce_flutter/model/product_item.dart';
import 'package:ecommerce_flutter/ui/component/stepper/quantity_stepper.dart';
import 'package:flutter/material.dart';

import '../../component/button/favorite_button.dart';

class DetailMobilePage extends StatefulWidget {
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
  State<DetailMobilePage> createState() => _DetailMobilePage();
}

class _DetailMobilePage extends State<DetailMobilePage> {
  int _quantity = 0;

  void _increment() => setState(() => _quantity++);

  void _decrement() =>
      setState(() => _quantity = _quantity > 1 ? _quantity - 1 : 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // detail screen content
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 96.0),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 16.0,
                  right: 16.0,
                  bottom: 64.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 36.0),
                          child: Image.network(widget.product.imageAsset),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        widget.product.name,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Staatliches',
                        ),
                      ),
                    ),
                    Text(
                      widget.product.price,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(color: Colors.grey),
                    ),
                    Text(
                      "Deskripsi Produk",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        widget.product.description,
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
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Oxygen',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final String imageUrl =
                              widget.product.imageUrls[index];
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(imageUrl),
                            ),
                          );
                        },
                        itemCount: widget.product.imageUrls.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // back button and favorite
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
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

          // Sticky stepper at bottom
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                children: [
                  _quantity == 0
                      ? Expanded(
                        child: ElevatedButton(
                          onPressed: _increment,
                          child: Text('+ Add to Cart'),
                        ),
                      )
                      : Expanded(
                        child: QuantityStepper(), // Your stepper widget
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
