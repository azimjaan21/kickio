import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kickio/data/providers/products.dart';
import 'package:kickio/ui/screens/tabs/cart_screen.dart';
import 'package:provider/provider.dart';

import '../../data/providers/cart.dart';
import '../widgets/appbar_details.dart';

class NewestShoesDetailsScreen extends StatefulWidget {
  const NewestShoesDetailsScreen({super.key});

  static const routeName = '/newestdetailsScreen';

  @override
  State<NewestShoesDetailsScreen> createState() =>
      _NewestShoesDetailsScreenState();
}

class _NewestShoesDetailsScreenState extends State<NewestShoesDetailsScreen> {
  // ignore: unused_field
  //Sizesssssssss
  int _selectedSizeIndex = -1;
  final List<String> shoeSizes = [
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
  ];

  //Colors of Shoessssssssssss
  int _selectedColorIndex = -1;
  final List<Color> shoeColors = [
    Colors.black,
    const Color(0xffB4B3B3),
    Colors.yellow,
    const Color(0xffEB0909),
  ];

  @override
  Widget build(BuildContext context) {

    final shoesId = ModalRoute.of(context)?.settings.arguments;
    final newestList =
        Provider.of<Products>(context).findByNewestId(shoesId as String);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DetailsAppBar(newestList: newestList),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.42,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.42,
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/nikesvg.svg',
                          width: 280,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        newestList.imgUrl,
                        width: 280,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Column(
                        children: [
                          const Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: List.generate(
                              shoeSizes.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedSizeIndex = index;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: _selectedSizeIndex == index
                                          ? Colors.black
                                          : const Color(0xffEFEFEF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      shoeSizes[index],
                                      style: TextStyle(
                                        color: _selectedSizeIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${newestList.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 71, 224, 160),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'In Stock',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  newestList.description,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: List.generate(
                    shoeColors.length,
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColorIndex = i;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: shoeColors[i],
                          ),
                          child: _selectedColorIndex == i
                              ? const Icon(
                                  Icons.check,
                                  size: 33,
                                  color: Colors.white,
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //

              // add to cart BUTTON
              Consumer<Cart>(
                builder: (ctx, cart, child) {
                  final isAddedCart = cart.cartItems.containsKey(shoesId);
                  if (isAddedCart) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        height: 66,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 215, 215, 215),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_checkout_outlined,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Go To Cart',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        cart.addToCart(
                          newestList.id,
                          newestList.title,
                          newestList.price,
                          newestList.imgUrl,
                        );
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        height: 66,
                        decoration: BoxDecoration(
                          color: const Color(0xff363636),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
