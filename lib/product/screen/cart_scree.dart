import 'package:flutter/material.dart';
import 'package:machine_test_adss/product/controller/product_controller.dart';
import 'package:machine_test_adss/product/widget/product_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
   @override
  void initState() {
    Provider.of<ProductController>(context, listen: false).getCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: ListView.builder(
        itemCount: productData.cartList.length,
        itemBuilder: (context, index) => ProductWidget(
          category: productData.cartList[index].name,
          isCart: false,
          name: productData.cartList[index].name,
          price: productData.cartList[index].price,
          stock: productData.cartList[index].stock,
        ),
      ),
    );
  }
}
