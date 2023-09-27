import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/products.dart';
import 'manage_item_product.dart';

class ManageProductButton extends StatelessWidget {
  const ManageProductButton({super.key});

  @override
  Widget build(BuildContext context) {
final productData = Provider.of<Products>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('User Settings'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: productData.shoesList.length,
        itemBuilder: (context, i) {
          final product = productData.shoesList[i];
          return ChangeNotifierProvider.value(
            value: product,
            child: const ManageProductItem());
        },
      ),
    );
  }
}