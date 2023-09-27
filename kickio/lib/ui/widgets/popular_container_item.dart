import 'package:flutter/material.dart';
import 'package:kickio/ui/screens/newest_shoes_details_screen.dart';

class PopularContainer extends StatelessWidget {
  final String shoesId;
  final String name;
  final String image;
  final double amount;

  const PopularContainer({
    super.key,
    required this.shoesId,
    required this.name,
    required this.image,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15, vertical: 15,
      ),
      child: Ink(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              NewestShoesDetailsScreen.routeName,
              arguments: shoesId,
            );
          },
          child: Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.centerRight,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 140,
                decoration: BoxDecoration(
                  color: const Color(0xffEFEFEF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/nike.png',
                          width: 170,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                              children: [
                                TextSpan(
                                  text: name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const TextSpan(
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  text: '\nFree Metcon ',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$$amount',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                image,
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
