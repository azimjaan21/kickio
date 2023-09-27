import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../data/providers/cart.dart';
import 'remove_cart_button.dart';

class CartListItem extends StatelessWidget {
  final String productId;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;

  const CartListItem(
      {super.key,
      required this.productId,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.quantity});

  void _notifyUserAboutRemove(BuildContext context, Function() remove) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        contentTextStyle:
            const TextStyle(color: Color.fromARGB(255, 122, 121, 121)),
        title: const Text('Are you sure ?'),
        content: const Text('This product will be removed from cart !'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              remove();
              Navigator.of(context).pop();
            },
            child: const Text(
              "Remove",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Slidable(
      key: ValueKey(productId),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          //
          //REMOVE BUTTON
          InkWell(
            onTap: () =>
                _notifyUserAboutRemove(context, () => cart.remove(productId)),
            child: const RemoveButton(),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Container(
          height: 140,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(7, 255, 168, 1),
                    ),
                    child: Image.asset(imageUrl),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '\$${(price * quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          // color: Color(0xff0ACF83),
                        ),
                      ),
                      Row(
                        children: [
                          //
                          //DECREMENT BUTTON

                          IconButton(
                            onPressed: () =>
                                cart.removeSingleFromCart(productId),
                            icon: const Icon(Icons.remove),
                          ),

                          Container(
                            width: 35,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100,
                            ),
                            child: Text(
                              '$quantity',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //
                          //ADD BUTTON

                          IconButton(
                            onPressed: () => cart.addToCart(
                                productId, title, price, imageUrl),
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
