import 'package:flutter/material.dart';
import 'package:kickio/ui/screens/tabs/cart_screen.dart';

class CustomCart extends StatelessWidget {
  final Widget icon;
  final String number;
  const CustomCart({super.key, required this.icon, required this.number});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          icon: icon,
        ),
        Positioned(
          right: 2,
          top: 0,
          child: Container(
            height: 19,
            width: 19,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 71, 224, 160),
                shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(number),
          ),
        ),
      ],
    );
  }
}
