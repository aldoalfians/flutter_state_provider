import 'package:flutter/material.dart';
import 'package:flutter_provider_state/widgets/proudct_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
      ),
      body: Product_Grid(),
    );
  }
}
