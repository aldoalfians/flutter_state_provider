import 'package:flutter/material.dart';
import 'package:flutter_provider_state/providers/cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_state/providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // listen false agar tidak membuang memory
    // Gunakan consumer apabila ingin melakukan perubahan di bagian widget tertentu
    final productData = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            "${productData.imageUrl}",
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: (value.isFavorite)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border_outlined),
              color: Theme.of(context).accentColor,
              onPressed: () {
                productData.statusFav();
              },
            ),
          ),
          title: Text(
            "${productData.title}",
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Add To Cart"),
                  duration: Duration(
                    milliseconds: 500,
                  ),
                ),
              );
              cart.addCart(productData.id as String,
                  productData.title as String, productData.price as double);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
