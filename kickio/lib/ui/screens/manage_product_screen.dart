import 'package:flutter/material.dart';
import 'package:kickio/ui/screens/add_product_screen.dart';
import 'package:kickio/ui/widgets/manage_item_product.dart';
import 'package:provider/provider.dart';

import '../../data/providers/products.dart';

class ManageProductScreen extends StatelessWidget {
  const ManageProductScreen({super.key});

  static const routeName = '/manageProduct-screen';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Settings'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddProductScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productData.shoesList.length,
        itemBuilder: (context, i) {
          final product = productData.shoesList[i];
          return ChangeNotifierProvider.value(
              value: product, child: const ManageProductItem());
        },
      ),
    );
  }
}
