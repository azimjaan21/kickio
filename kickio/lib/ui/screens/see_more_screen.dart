import 'package:flutter/material.dart';
import 'package:kickio/data/providers/products.dart';
import 'package:provider/provider.dart';

import '../../data/models/product.module.dart';
import '../widgets/newest_container_item.dart';

class SeeMoreScreen extends StatefulWidget {
  const SeeMoreScreen({super.key});

  @override
  State<SeeMoreScreen> createState() => _SeeMoreScreenState();
}

class _SeeMoreScreenState extends State<SeeMoreScreen> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(
      context,
      listen: true,
    );
    final shoesList = productsData.shoesList;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Newest shoes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid.builder(
            itemBuilder: (ctx, i) => ChangeNotifierProvider<ShoesProduct>.value(
              value: shoesList[i],
              child: const NewestContainer(),
            ),
            itemCount: shoesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
          ),
        ],
      ),
    );
  }
}
