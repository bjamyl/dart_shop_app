import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    // required this.id,
    // required this.title,
    // required this.imageUrl
  });
  // final String id;
  // final String title;
  // final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
    );
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
                color: Theme.of(context).colorScheme.secondary,
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.toggleFavoriteStatus();
                }),
            trailing: IconButton(
              color: Theme.of(context).colorScheme.secondary,
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            )),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
