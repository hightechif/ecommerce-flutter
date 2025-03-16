import 'package:ecommerce_flutter/ui/screen/main/showcase_grid.dart';
import 'package:ecommerce_flutter/ui/screen/main/showcase_list.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const ShowcaseList();
          } else if (constraints.maxWidth <= 1200) {
            return const ShowcaseGrid(gridCount: 4);
          } else {
            return const ShowcaseGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}
