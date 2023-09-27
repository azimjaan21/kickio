import 'package:flutter/material.dart';

import '../../data/models/product.module.dart';


class DetailsAppBar extends StatefulWidget {
  const DetailsAppBar({
    super.key,
    required this.newestList,
  });

  final ShoesProduct newestList;

  @override
  State<DetailsAppBar> createState() => _DetailsAppBarState();
}

class _DetailsAppBarState extends State<DetailsAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 28,
            ),
          ),
          Text(
            widget.newestList.title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(width: 20,),
        ],
      ),
    );
  }
}