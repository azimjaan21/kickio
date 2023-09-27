// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kickio/ui/screens/tabs_screen.dart';
import 'package:kickio/ui/widgets/cart_list_item.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/cart.dart';
import '../../../data/providers/orders.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  void _notifyUserAboutClearCart(BuildContext context, Function() remove) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        contentTextStyle:
            const TextStyle(color: Color.fromARGB(255, 122, 121, 121)),
        title: const Text('Are you sure ?'),
        content: const Text('Cart will be cleared !'),
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
              "Clear",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        actions: [
          cart.cartItems.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _notifyUserAboutClearCart(context, () => cart.clearCart());
                  },
                  icon: SvgPicture.asset('assets/images/svgs/delete.svg'),
                )
              : const SizedBox(),
        ],
      ),
      body: Column(
        children: [
          cart.cartItems.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: cart.cartItems.length,
                    itemBuilder: (ctx, i) {
                      final cartItem = cart.cartItems.values.toList()[i];

                      return CartListItem(
                        productId: cart.cartItems.keys.toList()[i],
                        title: cartItem.title,
                        imageUrl: cartItem.image,
                        price: cartItem.price,
                        quantity: cartItem.quantity,
                      );
                    },
                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: SvgPicture.asset(
                          'assets/images/svgs/emptycart.svg',
                          color: const Color.fromARGB(255, 137, 137, 137),
                        ),
                      ),
                      Text(
                        'Cart is Empty !',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Color(0xffF6F6F6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cart.cartItems.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 112, 112, 112),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '\$${cart.totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                cart.cartItems.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          orders.addToOrders(
                            cart.cartItems.values.toList(),
                            cart.totalPrice,
                          );
                          cart.clearCart();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black87,
                              content: const Text('Product were ordered!'),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height - 150,
                                  right: 20,
                                  left: 20),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff0ACF83),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Proceed to Order',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const TabsScreen(),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Go Shopping',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(
                                Icons.shopping_bag_outlined,
                                size: 30,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
