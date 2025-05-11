import 'package:ecommerce_flutter/model/product_item.dart';
import 'package:flutter/material.dart';

import 'detail_mobile_page.dart';
import 'detail_web_page.dart';

class DetailScreen extends StatelessWidget {
  final ProductItem product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(
            product: product,
            informationTextStyle: informationTextStyle,
            ticketPrice: "ticketPrice",
          );
        } else {
          return DetailMobilePage(
            product: product,
            informationTextStyle: informationTextStyle,
            ticketPrice: "ticketPrice",
          );
        }
      },
    );
  }
}
