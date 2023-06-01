import 'package:flutter/material.dart';
import './product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.showFavs,
  });

  final bool showFavs;
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs? productsData.favoriteItems: productsData.items;
    return GridView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 3 / 2),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: products[i],
              child: ProductItem(
                  // id: products[i].id,
                  // imageUrl: products[i].imageUrl,
                  // title: products[i].title,
                  ),
            ));
  }
}
