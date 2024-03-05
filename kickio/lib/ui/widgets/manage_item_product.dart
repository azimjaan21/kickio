import 'package:flutter/material.dart';
import 'package:kickio/data/models/product.module.dart';
import 'package:provider/provider.dart';

class ManageProductItem extends StatelessWidget {
  const ManageProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ShoesProduct>(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(product.imgUrl,),
          ),
          title: Text(product.title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
