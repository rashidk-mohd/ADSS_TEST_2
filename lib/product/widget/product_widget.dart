import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  final int? stock;
  final VoidCallback? onAddToCart;
  bool isCart = false;

  ProductWidget(
      {super.key,
      required this.name,
      required this.category,
      required this.price,
       this.stock,
       this.onAddToCart,
      required this.isCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Adding box shadow
      margin: const EdgeInsets.all(8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(category),
            const SizedBox(height: 4),
            Text('Price: \$${price.toStringAsFixed(2)}'),
            !isCart ? const SizedBox() : Text('Stock: $stock remaining'),
          ],
        ),
        trailing: !isCart
            ? const SizedBox()
            : IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: onAddToCart,
              ),
      ),
    );
  }
}
