import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});
  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
                color: Theme.of(context).colorScheme.secondary,
                icon: const Icon(Icons.favorite),
                onPressed: () {}),
            trailing: IconButton(
              color: Theme.of(context).colorScheme.secondary,
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            title: Text(
              title,
              textAlign: TextAlign.center,
            )),
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
