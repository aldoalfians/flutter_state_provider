import 'package:flutter/material.dart';
import 'package:flutter_provider_state/providers/all_products.dart';
import 'package:flutter_provider_state/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class Product_Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    final allProduct = productData.products;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allProduct.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: allProduct[i], // kalau bentuknya value langsung me return value
        // create: (context) => allProduct[i], // ini kurang efisien karena returnnya bukan class, karena menggunakan create itu membuat render baru
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
