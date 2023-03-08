import 'package:flutter/material.dart';
import 'package:flutter_provider_state/providers/cart.dart';
import 'package:flutter_provider_state/screens/cart_screen.dart';
import 'package:flutter_provider_state/widgets/badge_cart.dart';
import 'package:flutter_provider_state/widgets/proudct_grid.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) => BadgeCart(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    CartScreen.routName,
                  );
                },
              ),
              value: value.jumlah.toString(),
            ),
          )
        ],
      ),
      body: Product_Grid(),
    );
  }
}
