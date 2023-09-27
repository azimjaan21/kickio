import 'package:flutter/material.dart';
import 'package:kickio/data/models/product.module.dart';
import 'package:kickio/data/providers/cart.dart';
import 'package:provider/provider.dart';

import '../screens/newest_shoes_details_screen.dart';

class NewestContainer extends StatelessWidget {
  const NewestContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final newestList = Provider.of<ShoesProduct>(
      context,
      listen: false,
    );
    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffEFEFEF),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                NewestShoesDetailsScreen.routeName,
                arguments: newestList.id,
              );
            },
            child: Container(
              height: 156,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffEFEFEF),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(newestList.imgUrl),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 5,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        newestList.title,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '\$${newestList.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Consumer(
                    builder: (context, value, child) => IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Added to Your Cart',
                            ),
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                        cart.addToCart(newestList.id, newestList.title,
                            newestList.price, newestList.imgUrl);
                        // print('added cart Items :');
                        // print(cart.cartItems['p1']!.quantity);
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Color.fromARGB(255, 71, 224, 160),
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer<ShoesProduct>(
            builder: (context, value, child) {
              return IconButton(
                onPressed: () {
                  newestList.toggleLike();
                },
                icon: newestList.isLike
                    ? const Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 255, 0, 0),
                        size: 28,
                      )
                    : const Icon(
                        Icons.favorite_border_outlined,
                        color: Color(0xffCFCFCF),
                        size: 28,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
