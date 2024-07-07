import 'package:flutter/material.dart';
import 'package:machine_test_adss/product/screen/cart_scree.dart';
import 'package:machine_test_adss/product/controller/product_controller.dart';
import 'package:machine_test_adss/product_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ProductController>(context, listen: false).getProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<ProductController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        automaticallyImplyLeading: true,
        actions: [IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ));
            },
            icon:const Padding(
              padding:  EdgeInsets.all(8.0),
              child:  Row(
                children: [
                   Text("Your Cart"),
                   Icon(Icons.add_shopping_cart),
                  
                ],
              ),
            ))],
      ),
      body: ListView.builder(
        itemCount: productData.products.length,
        itemBuilder: (context, index) => ProductWidget(
          isCart: true,
          name: productData.products[index].name,
          category: productData.products[index].category,
          onAddToCart: () {
            productData.addToCart(productData.products[index]);
          },
          price: productData.products[index].price,
          stock: productData.products[index].stock,
        ),
      ),
    );
  }
}
