import 'package:ecommerce_flutter/model/product_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'detail_mobile_page.dart';
import 'detail_web_page.dart';

class DetailScreen extends StatelessWidget {
  final ProductItem product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');
    Locale locale = const Locale("id", "ID");
    String localeID = locale.toLanguageTag().replaceAll('-', '_');
    var formatter = NumberFormat.decimalPattern(localeID);
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
