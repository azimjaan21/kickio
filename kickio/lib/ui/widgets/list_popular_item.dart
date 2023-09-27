import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/products.dart';
import 'popular_container_item.dart';

class ListPopularItem extends StatelessWidget {
  const ListPopularItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(
      context,
      listen: false,
    );
    final popularShoesList = productsData.shoesList;

    return SizedBox(
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) => PopularContainer(
          shoesId: popularShoesList[index].id,
          name: popularShoesList[index].title,
          image: popularShoesList[index].imgUrl,
          amount: popularShoesList[index].price,
        ),
        itemCount: popularShoesList.length,
      ),
    );
  }
}
