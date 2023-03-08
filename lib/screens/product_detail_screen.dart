import 'package:flutter/material.dart';
import 'package:flutter_provider_state/providers/cart.dart';
import 'package:flutter_provider_state/providers/product.dart';
import 'package:flutter_provider_state/providers/all_products.dart';
import 'package:flutter_provider_state/screens/cart_screen.dart';
import 'package:flutter_provider_state/widgets/badge_cart.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!

    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          actions: [
            Consumer<Cart>(
              builder: (context, value, child) {
                return BadgeCart(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        CartScreen.routName,
                      );
                    },
                  ),
                  value: value.jumlah.toString(),
                );
              },
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                "${product.imageUrl}",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 38,
            ),
            Text(
              "${product.title}",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${product.price}",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${product.description}",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Add To Cart"),
                    duration: Duration(
                      milliseconds: 500,
                    ),
                  ),
                );
                cart.addCart(product.id as String, product.title as String,
                    product.price as double);
              },
              child: Text(
                "Add To Cart",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ));
  }
}
